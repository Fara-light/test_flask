import sqlite3 
from flask import Flask, render_template


app = Flask(__name__)


@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)


@app.route('/index/')
def index():
    conn = sqlite3.connect('taxi.db')
    cur = conn.cursor()
    cur.execute('SELECT car_id AS cid, manufacturer_name AS p, car_name AS c FROM car JOIN manufacturer USING (manufacturer_id);')
    carList = cur.fetchall()
    conn.close()
    return render_template('index.html', carList = carList)


@app.route('/car/<int:carID>', methods=['GET'])
def car(carID): 
    conn = sqlite3.connect('taxi.db')
    cur = conn.cursor()
    cur.execute(f'SELECT company_name as cn, category_name as cat_n, category_price as cp FROM car JOIN category_car USING (car_id) JOIN category USING (category_id) JOIN company USING (company_id) WHERE car_id = {carID};')
    carInfo = cur.fetchall()
    conn.close()
    return render_template('car_info.html', carInfo = carInfo)


if __name__ == "__main__":
    app.run(debug=True)
