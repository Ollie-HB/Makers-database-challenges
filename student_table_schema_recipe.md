1. Extract nouns from the user stories or specification

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

Nouns: student name, cohort name, cohort starting date, student cohort

2. Infer the Table Name and Columns


Record	        Properties
student         name, cohort_id
cohort	        name, starting_date

Name of the first table (always plural): students

Column names: name, cohort_id

Name of the second table (always plural): cohorts

Column names: name, starting_date

3. Decide the column types.

Table: students
id: SERIAL
name: text
cohort_id: int

Table: cohorts
id: SERIAL
name: text
starting_date: date

4. Decide on The Tables Relationship

1. Can one student have many cohorts? NO
2. Can one cohort have many students? YES

-> Therefore, the foreign key is on the students table.

4. Write the SQL.

-- file: students_table_2.sql

CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text
  starting_date date
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);

5. Create the tables.

psql -h 127.0.0.1 student_directory_2 < spec/students_table_2.sql