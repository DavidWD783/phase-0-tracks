
SQL_CREATE_CAMPUSES = <<-SQL
CREATE TABLE IF NOT EXISTS campuses (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL

SQL_CREATE_CAMPUSES_STUDENTS = <<-SQL
  CREATE TABLE IF NOT EXISTS campuses_students (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    campus_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (campus_id) REFERENCES campuses(id)
  )
SQL

SQL_ALL_STUDENTS = <<-SQL
  SELECT * FROM students
  SQL

SQL_INSERT_STUDENTS = <<-SQL
  INSERT INTO students (name, campus, age) VALUES (?,?,?)
  SQL

SQL_SELECT_ONE_STUDENT = <<-SQL
  SELECT * FROM students WHERE id=?
  SQL

SQL_INSERT_CAMPUS = <<-SQL
  INSERT INTO campuses (name) VALUES (?)
  SQL

SQL_ALL_CAMPUSES = <<-SQL
  SELECT * FROM campuses
  SQL

SQL_INSERT_CAMPUS_STUDENT = <<-SQL
  INSERT INTO campuses_students (student_id, campus_id) VALUES (?,?)
  SQL

SQL_ALLOCATIONS = <<-SQL
    SELECT s.name student, c.name campus FROM campuses c, students s, campuses_students cs
      WHERE c.id = cs.campus_id
      AND   cs.student_id = s.id
  SQL