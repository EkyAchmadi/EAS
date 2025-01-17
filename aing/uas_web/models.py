from flask_mysqldb import MySQL

# Fungsi untuk menambahkan pengguna baru
def add_user(mysql, username, email, password):
    cur = mysql.connection.cursor()
    cur.execute(
        "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
        (username, email, password)
    )
    mysql.connection.commit()
    cur.close()

# Fungsi untuk mendapatkan data pengguna berdasarkan username
def get_user_by_username(mysql, username):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users WHERE username = %s", (username,))
    user = cur.fetchone()
    cur.close()
    return user

# Fungsi untuk menambahkan data mahasiswa
def add_student(mysql, name, email, jurusan, nilai):
    cur = mysql.connection.cursor()
    cur.execute(
        "INSERT INTO students (name, email, jurusan, nilai) VALUES (%s, %s, %s, %s)",
        (name, email, jurusan, nilai)
    )
    mysql.connection.commit()
    cur.close()

# Fungsi untuk mendapatkan semua data mahasiswa
def get_all_students(mysql):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM students")
    students = cur.fetchall()
    cur.close()
    return students
