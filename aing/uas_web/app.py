from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Ganti dengan kunci rahasia Anda

# Konfigurasi Database
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'database_uas'

mysql = MySQL(app)

# Fungsi untuk menambahkan mahasiswa
def Menambahkan(mysql, name, email, jurusan, nilai):
    cur = mysql.connection.cursor()
    cur.execute(
        "INSERT INTO students (name, email, jurusan, nilai) VALUES (%s, %s, %s, %s)",
        (name, email, jurusan, nilai)
    )
    mysql.connection.commit()
    cur.close()

# Fungsi untuk mengambil semua data mahasiswa
def get_all_students(mysql):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM students")
    students = cur.fetchall()
    cur.close()
    return students

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = generate_password_hash(request.form['password'])
        
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
                    (username, email, password))
        mysql.connection.commit()
        cur.close()
        
        flash('Registrasi berhasil! Silakan login.', 'success')
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE username = %s", (username,))
        user = cur.fetchone()
        cur.close()
        
        if user and check_password_hash(user[3], password):
            flash('Login berhasil!', 'success')
            return redirect(url_for('dashboard'))
        else:
            flash('Username atau password salah.', 'danger')
    return render_template('login.html')

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/Menambahkan', methods=['GET', 'POST'])
def Menambahkan_view():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        jurusan = request.form['jurusan']
        nilai = request.form['nilai']
        
        Menambahkan(mysql, name, email, jurusan, nilai)
        flash('Data mahasiswa berhasil disimpan!', 'success')
        return redirect(url_for('lihat'))
    
    return render_template('Menambahkan.html')

@app.route('/lihat')
def lihat():
    students = get_all_students(mysql)
    return render_template('lihat.html', students=students)

if __name__ == '__main__':
    app.run(debug=True)
