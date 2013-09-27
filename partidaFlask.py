import sqlite3
from contextlib import closing
from flask import (
    Flask, request, session, g, redirect, url_for,
    abort, render_template, flash
 )

# configuration
DATABASE = 'partidaflask.db'
DEBUG = True
SECRET_KEY = 'development key'
USERNAME = 'martin'
PASSWORD = 'martin'


# create our little application :)
app = Flask(__name__)
app.config.from_object(__name__)

def connect_db():
    return sqlite3.connect(app.config['DATABASE'])


def init_db():
    with closing(connect_db()) as db:
        with app.open_resource('schemapartida.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()

@app.before_request
def before_request():
    g.db = connect_db()

@app.teardown_request
def teardown_request(exception):
    db = getattr(g, 'db', None)
    if db is not None:
        db.close()

@app.route('/')
def index():
    return render_template('show_tipotramite.html')


"""@app.route('/partidanacimiento', methods=['GET', 'POST'])
def partidanacimiento():
    return render_template('partida_nacimiento.html')
"""
@app.route('/consulta', methods=['GET', 'POST'])
def consulta():
    if request.method == 'GET':	
        return render_template('consulta.html')
    if request.method == 'POST':
	g.db.execute('insert into consultas (descripcion) values (?)',
                 [request.form['descripcion']])
        g.db.commit()
        flash('Tu consulta se ha enviado, en breve se te respondera, GRACIAS')
        return render_template('consulta.html')
        
    


if __name__ == '__main__':
    app.run()
