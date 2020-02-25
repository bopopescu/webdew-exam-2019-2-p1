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

@app.route('/')
def hello_world():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute("Select * From ReE_main")
    users = cursor.fetchall()
    cursor.close()
    return render_template('index.html', users=users)

def load_status():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute("select * from ReE_status;")
    status = cursor.fetchall()
    cursor.close()
    return status

def load_users():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute("select * from ReE_user;")
    users = cursor.fetchall()
    cursor.close()
    return users

@app.route('/users/new')
@flask_login.login_required
def new():
    return render_template('new.html', users=load_users(), status=load_status(), data={})

@app.route('/users/create', methods=['POST'])
@flask_login.login_required
def create():
    name = request.form.get('name')
    author = request.form.get('author')
    year = request.form.get('year')
    count = request.form.get('count')
            
    if name=="" or author=="" or year=="" or count=="":
        data = { 
            "id" : id,
            "name" : name,
            "author" : author,
            "year" : year,
            "count" : count,
        }
        flash("Необходимо заполнить все поля!", 'danger')
        return render_template('new.html', users=load_users(), status=load_status(), data=data)
        

    query = '''insert into technical_supp (name, author, year, count)
    values (%s, %s, %s, %s);
    '''
    values = (name, author, year, count)
    cursor = mysql.connection().cursor(named_tuple=True)
    try:
        cursor.execute(query, values)
    except connector.errors.DatabaseError:
        flash("Введены некоректные данные! Ошибка сохранения.", 'danger')
        data = { 
            "id" : id,
            "name" : name,
            "author" : author,
            "year" : year,
            "count" : count,
        }
        return render_template('new.html', users=load_users(), status=load_status(), data=data)
        
    mysql.connection().commit()
    flash("Данные успешно добавлены!", 'success')
    return(redirect(url_for('hello_world')))


@app.route('/edit/<int:id>')
@flask_login.login_required
def edit(id):
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute('select * from ReE_main where id =%s', (id,))
    data = cursor.fetchone()
    cursor.close()
    if not flask_login.current_user.can('edit', record=data):
        flash("У вас недостаточно прав для выполнения данного действия!", 'danger')
        return redirect(url_for("hello_world"))
    return render_template('edit.html', users=load_users(), status=load_status(), data=data)
        

@app.route('/<int:id>/update', methods=['POST'])
@flask_login.login_required
def update(id):
    name = request.form.get('name')
    author = request.form.get('author')
    year = request.form.get('year')
    count = request.form.get('count')
    if name=="" or author=="" or year=="" or count=="":
        data = {
            "id" : id,
            "name" : name,
            "author" : author,
            "year" : year,
            "count" : count,
        }
        flash("Необходимо заполнить все поля!", 'danger')
        return render_template('edit.html', users=load_users(), status=load_status(), data=data)

    query = '''update ReE_main SET name=%s, author=%s, year=%s, count=%s
    WHERE id=%s;
    '''
    values = (name, author, year, count, id)
    cursor = mysql.connection().cursor(named_tuple=True)
    try:
        cursor.execute(query, values)
    except connector.errors.DatabaseError:
        flash("Введены некоректные данные! Ошибка сохранения.", 'danger')
        data = {
            "id" : id,
            "name" : name,
            "author" : author,
            "year" : year,
            "count" : count,
        }
        return render_template('edit.html', users=load_users(), status=load_status(), data=data)
        
    mysql.connection().commit()
    flash("Данные успешно изменены!", 'success')
    return(redirect(url_for('hello_world')))

@app.route('/users/<int:id>/delete', methods=['GET', 'POST'])
@flask_login.login_required
def delete(id):
    if not flask_login.current_user.can('delete'):
        flash("У вас недостаточно прав для выполнения данного действия!", 'danger')
        return redirect(url_for("hello_world"))
    query = 'Delete from ReE_main where id = %s'
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute(query, (id,))
    mysql.connection().commit()
    flash("Запись успешно удалена", 'successs')
    return redirect(url_for('hello_world'))

