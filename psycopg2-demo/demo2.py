import psycopg2

connection = psycopg2.connect('dbname = example2')
cursor = connection.cursor()

cursor.execute('''
CREATE TABLE ex_table (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);
''')
cursor.execute('''
INSERT INTO ex_table (id, first_name, last_name)
VALUES
    (1, 'Laura', 'Benz'),
    (2, 'Erik', 'Sommer')
''')

connection.commit()

cursor.close()
connection.close()
