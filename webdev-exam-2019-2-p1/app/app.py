from flask import Flask, render_template, request, session, redirect, url_for, flash
import re
import flask_login # Фласк логин для сессий
import mysql.connector as connector
from mysql_db import MySQL # Импортим класс общения с DB
from collections import Counter
import hashlib

app = Flask(__name__)
application = app
app.config.from_pyfile('config.py') # Берем конфиг для DB из файла
mysql = MySQL(app) # Инициализируем объект класса DB

import auth # Импортив модуль авторизации

@app.errorhandler(404)
def page_not_found(e):
    return render_template('error.html')

@app.route('/')
def hello_world():
    cursor = mysql.connection().cursor(named_tuple=True)
    querry= '''
   SELECT `technical_supp`.`id`, `technical_supp`.`дата`, `technical_supp`.`message`, status.status, treatment.type, `tech_users`.`FIO` FROM `technical_supp`, `status`, `treatment`, tech_users WHERE `technical_supp`.`status` =`status`.id and `technical_supp`.`type` = `treatment`.`id` and `technical_supp`.`пользователь` = `tech_users`.`id` ORDER BY `technical_supp`.`дата` DESC;
'''
    cursor.execute(querry)
    users = cursor.fetchall()
    cursor.close()
    return render_template('index.html', users=users)

def load_status():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute("select * from status;")
    status = cursor.fetchall()
    cursor.close()
    return status

def load_treatment():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute("select * from treatment;")
    treat = cursor.fetchall()
    cursor.close()
    return treat

def load_users():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute("select * from tech_users;")
    users = cursor.fetchall()
    cursor.close()
    return users

@app.route('/users/new')
@flask_login.login_required
def new():
    return render_template('new.html', users=load_users(), status=load_status(), treatment=load_treatment(), data={})

@app.route('/users/create', methods=['POST'])
@flask_login.login_required
def create():
    message = request.form.get('message')
    status = request.form.get('status')
    treatment = request.form.get('treatment')
    fio = request.form.get('fio')
            
    if message==""  or treatment=="" or fio=="":
        data = { 
            "message" : message,
            "status" : status,
            "treatment" : treatment,
            "fio" : fio
        }
        flash("Необходимо заполнить все поля!", 'danger')
        return render_template('new.html', users=load_users(), status=load_status(), treatment=load_treatment(), data=data)
        

    query = '''insert into technical_supp (message, status, type, пользователь)
    values (%s, %s, %s, %s);
    '''
    values = (message, status, treatment, fio)
    cursor = mysql.connection().cursor(named_tuple=True)
    try:
        cursor.execute(query, values)
    except connector.errors.DatabaseError:
        flash("Введены некоректные данные! Ошибка сохранения.", 'danger')
        data = { 
            "message" : message,
            "status" : status,
            "treatment" : treatment,
            "fio" : fio
        }
        return render_template('new.html', users=load_users(), status=load_status(), treatment=load_treatment(), data=data)
        
    mysql.connection().commit()
    flash("Данные успешно добавлены!", 'success')
    return(redirect(url_for('hello_world')))


@app.route('/edit/<int:id>')
@flask_login.login_required
def edit(id):
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute('select * from technical_supp where id =%s', (id,))
    data = cursor.fetchone()
    cursor.close()
    if not flask_login.current_user.can('edit', record=data):
        flash("У вас недостаточно прав для выполнения данного действия!", 'danger')
        return redirect(url_for("hello_world"))
    return render_template('edit.html', users=load_users(), status=load_status(), treatment=load_treatment(), data=data)
        

@app.route('/<int:id>/update', methods=['POST'])
@flask_login.login_required
def update(id):
    message = request.form.get('message')
    status = request.form.get('status')
    treatment = request.form.get('treatment')
    fio = request.form.get('fio')
    if status =="":
        status="1"
    if message==""  or treatment=="" or fio=="":
        data = {
            "id" : id,
            "message" : message,
            "status" : status,
            "type" : treatment,
            "пользователь" : fio
        }
        flash("Необходимо заполнить все поля!", 'danger')
        return render_template('edit.html', users=load_users(), status=load_status(), treatment=load_treatment(), data=data)

    query = '''update technical_supp SET message=%s, status=%s, type=%s, пользователь=%s
    WHERE id=%s;
    '''
    values = (message, status, treatment, fio, id)
    cursor = mysql.connection().cursor(named_tuple=True)
    try:
        cursor.execute(query, values)
    except connector.errors.DatabaseError:
        flash("Введены некоректные данные! Ошибка сохранения.", 'danger')
        data = {
            "id" : id,
            "message" : message,
            "status" : status,
            "type" : treatment,
            "пользователь" : fio
        }
        return render_template('edit.html', users=load_users(), status=load_status(), treatment=load_treatment(), data=data)
        
    mysql.connection().commit()
    flash("Данные успешно изменены!", 'success')
    return(redirect(url_for('hello_world')))

@app.route('/users/<int:id>/delete', methods=['GET', 'POST'])
@flask_login.login_required
def delete(id):
    if not flask_login.current_user.can('delete'):
        flash("У вас недостаточно прав для выполнения данного действия!", 'danger')
        return redirect(url_for("hello_world"))
    query = 'delete from technical_supp where id=%s'
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute(query, (id,))
    mysql.connection().commit()
    flash("Запись успешно удалена", 'successs')
    return redirect(url_for('hello_world'))

