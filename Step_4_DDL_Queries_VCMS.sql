CREATE TABLE Student
(
  Name VARCHAR(255) NOT NULL,
  Email_ID VARCHAR(255) NOT NULL,
  Password CHAR(8) NOT NULL,
  Student_ID INT NOT NULL,
  PRIMARY KEY (Student_ID),
  UNIQUE (Email_ID)
);

CREATE TABLE Teacher
(
  Name VARCHAR(255) NOT NULL,
  Email_ID VARCHAR(255) NOT NULL,
  Password CHAR(8) NOT NULL,
  Teacher_ID INT NOT NULL,
  PRIMARY KEY (Teacher_ID),
  UNIQUE (Email_ID)
);

CREATE TABLE Classroom
(
  Class_ID INT NOT NULL,
  Class_Name VARCHAR(255) NOT NULL,
  Class_Code CHAR(8) NOT NULL,
  Teacher_ID INT NOT NULL,
  PRIMARY KEY (Class_ID),
  FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID),
  UNIQUE (Class_Code)
);

CREATE TABLE Resources
(
  Resource_ID INT NOT NULL,
  Resource INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Resource_ID, Class_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classroom(Class_ID)
);

CREATE TABLE Announcements
(
  Announcement_ID INT NOT NULL,
  Announcement INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Announcement_ID, Class_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classroom(Class_ID)
);

CREATE TABLE Attendance
(
  Attendance_Percentage INT NOT NULL,
  Class_ID INT NOT NULL,
  Student_ID INT NOT NULL,
  PRIMARY KEY (Class_ID, Student_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classroom(Class_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Doubts
(
  Doubt_ID INT NOT NULL,
  Doubt INT NOT NULL,
  Answer INT NOT NULL,
  Student_ID INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Doubt_ID, Student_ID, Class_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classroom(Class_ID)
);

CREATE TABLE Assignments
(
  Assignment_ID INT NOT NULL,
  Assignment INT NOT NULL,
  Max_Grade INT NOT NULL,
  Due_Date INT NOT NULL,
  Weightage INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Assignment_ID, Class_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classroom(Class_ID)
);

CREATE TABLE Assignment_Submissions
(
  Submission INT NOT NULL,
  Obtained_Grade INT NOT NULL,
  Comment INT NOT NULL,
  Student_ID INT NOT NULL,
  Assignment_ID INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Student_ID, Assignment_ID, Class_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
  FOREIGN KEY (Assignment_ID, Class_ID) REFERENCES Assignments(Assignment_ID, Class_ID)
);

CREATE TABLE Exams
(
  Exam_ID INT NOT NULL,
  Exam_Form_Link INT NOT NULL,
  Max_Grade INT NOT NULL,
  Date INT NOT NULL,
  Weightage INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Exam_ID, Class_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classroom(Class_ID)
);

CREATE TABLE Exam_Results
(
  Obtained_Grade INT NOT NULL,
  Student_ID INT NOT NULL,
  Exam_ID INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Student_ID, Exam_ID, Class_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
  FOREIGN KEY (Exam_ID, Class_ID) REFERENCES Exams(Exam_ID, Class_ID)
);

CREATE TABLE Enrolled_In
(
  Student_ID INT NOT NULL,
  Class_ID INT NOT NULL,
  PRIMARY KEY (Student_ID, Class_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
  FOREIGN KEY (Class_ID) REFERENCES Classroom(Class_ID)
);
