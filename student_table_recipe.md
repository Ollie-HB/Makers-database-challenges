1. Extract nouns from the user stories or specification

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

Nouns: students, name, cohort

2. Infer the Table Name and Columns

Record	  Properties
student	  name, cohort

Name of the table: students

Column names: name, cohort

3. Decide the column types.

id = SERIAL
name = text
cohort = text

4. Write the SQL.

file: students_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort text
);

5. Create the table.

psql -h 127.0.0.1 student_directory_1 < students_table.sql