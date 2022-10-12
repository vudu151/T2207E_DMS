create table Classes(
   Code varchar(20) primary key,
   Name varchar(255) not null unique,
   Classroom int
);
create table Subjects(
   Code varchar(20) primary key,
   Name nvarchar(255) not null unique
);
create table Students(
   Code varchar(20) primary key,
   Name nvarchar(255) not null,
   Birthday date not null check (Birthday <getdate()),
   ClassCode varchar(20) foreign key references Classes(Code)
);
create table Results(
   Id int primary key identity(1,1),
   Scores int not null check(Scores >=0 and Mark <=10) default 0,
   Result varchar(20) not null check(Result in (N'Yếu',N'Trung bình',N'Khá',N'Giỏi')),
   SubjectCode varchar(20) not null foreign key references Subjects(Code),
   StudentCode varchar(20) not null foreign key references Students(Code)
);
create table StudentSubjects(
   StudentCode varchar(20) not null foreign key references Students,
   SubjectCode varchar(20) not null foreign key references Subjects
);
