import psycopg2

connection = psycopg2.connect('dbname=example')

cursor = connection.cursor()

cursor.execute('DROP TABLE IF EXISTS table2')

cursor.execute('''
    CREATE TABLE table2(
        id INTEGER PRIMARY KEY,
        completed BOOLEAN NOT NULL DEFAULT False);
    ''')

data = {
    'id1': 1,
    'id2': 2,
    'completed1': True,
    'completed2': False
}

cursor.execute(
    f'INSERT INTO table2 (id, completed) VALUES ({data["id1"]}, {data["completed1"]}), ({data["id2"]}, {data["completed2"]});')

cursor.execute('SELECT * from table2')

res = cursor.fetchall()
print(res)

connection.commit()

connection.close()
cursor.close()
