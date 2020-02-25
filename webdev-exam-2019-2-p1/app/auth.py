from flask import Flask, render_template, request, session, redirect, url_for, flash
import re
import flask_login
import mysql.connector
from app import app, mysql # Импортим app, и объект DB
from collections import namedtuple
import mysql.connector as connector
import hashlib

ADMIN_ROLE_ID = 1
MANAGE_ROLE_ID = 2
USER_ROLE_ID = 3

login_manager = flask_login.LoginManager() # Инициализируем логин менеджер
login_manager.init_app(app)
login_manager.login_view = "login"
login_manager.login_message = "Для доступа к этой странице необходимо пройти процедуру аунтификации."

def is_admin():
    return flask_login.current_user.role_id == ADMIN_ROLE_ID # Проверка роли юзера текущей сессии

def is_manager():
    return flask_login.current_user.role_id == MANAGE_ROLE_ID # Проверка роли юзера текущей сессии

class UsersPolicy:
    def __init__(self, record=None):
        self.record = record
    
    def create(self):
        return is_admin()
    
    def delete(self):
        return is_admin()
    
    def edit(self):
        if(flask_login.current_user.id == USER_ROLE_ID):
            return False
        return is_admin() or is_manager
    

    

class User(flask_login.UserMixin):
    def can(self, action, record=None): # action - действие, record - запись из DB
        policy = UsersPolicy(record=record)
        method = getattr(policy, action, None) # тоже самое что и policy.action
        if method:
            return method()
        return False


@login_manager.user_loader # Запоминает пользователя в сессии
def load_user(id):
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute("select * from tech_users where id = %s;", (id,))
    user_from_db = cursor.fetchone()
    if user_from_db:
        user = User()
        user.id = user_from_db.id
        user.username = user_from_db.login
        user.role_id = user_from_db.role
        user.fio = user_from_db.FIO
        return user
    return None
    
    
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    username = request.form.get('username')
    password = request.form.get('password')
    if password and username:
        cursor = mysql.connection().cursor(named_tuple=True)
        cursor.execute('select id, login, role, FIO from tech_users where login=%s and password=%s', (username,password))
        user_from_db = cursor.fetchone()
        if user_from_db:
            user = User()
            user.id = user_from_db.id
            user.login = user_from_db.login
            user.role_id = user_from_db.role
            flask_login.login_user(user, remember=True)
            next = request.args.get('next')
            flash("Вы успешно аунтифицированы", "success")
            if next:
                return redirect(next)
            else:
                return redirect(url_for("hello_world"))
        flash("Введены неверные логин и/или пароль", "danger")
        return render_template('login.html')
    
    
@app.route('/logout')
@flask_login.login_required
def logout():
    flask_login.logout_user()
    return redirect(url_for('hello_world'))
