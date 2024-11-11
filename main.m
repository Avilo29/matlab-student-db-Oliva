% Author Name: Sydnie Oliva
% Email: Olivas22@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Date: 11/11/24



% Create the student database object
db = StudentDatabase();

% Creates the students
student1 = Student("ROW1", "Micheal", 20, 3.8, "Criminal Justice");
student2 = Student("ROW2", "Lily", 22, 3.5, "Communications");
student3 = Student("ROW3", "Gia", 25, 3.6, "Criminal Justice");
student4 = Student("ROW4", "Sam", 20, 3.2, "Physics");

% Adds the students to the database
db = db.addStudent(student1);
db = db.addStudent(student2);
db = db.addStudent(student3);
db = db.addStudent(student4);

% Saves the database to a .mat file
db.saveToFile("students.mat");

% Loads the database from the .mat file
db = db.loadFromFile("students.mat");

% Searches for a student by their ID
student = db.findStudentByID("ROW3");
% If the student is found the students info will be shown
if ~isempty(student)
    disp(student.displayInfo());
    %if the student isnt found the message below will display
else
    disp("Student not found");
end

% Creates the histograms

% GPA Distribution Histogram
gpas = [db.students.GPA];
figure;
% Creates a histogram with the bar color as green and the outline of the
% bars as black
histogram(gpas, 10, "FaceColor", "g", "EdgeColor", "k");
% Creates the labels for the histogram
title("GPA Distribution");
xlabel("GPA");
ylabel("Number of Students");

% Average GPA by Major
majors = unique(string({db.students.Major}));
avgGPA = zeros(1, length(majors));
for i = 1:length(majors)
    majorStudents = db.getStudentsByMajor(majors{i});
    avgGPA(i) = mean([majorStudents.GPA]);
end
figure;
bar(avgGPA);
% Sets the labels of each bar to be the majors counted in the bar
set(gca, "XTickLabel", majors);
% Creates the labels for the histogram
title("Average GPA by Major");
xlabel("Major");
ylabel("Average GPA");
xtickangle(45);

% Age Distribution
ages = [db.students.Age];
figure;
% Creates a histogram with the bar color as cyan and the outline of the
% bars as blue
histogram(ages, 10, "FaceColor", "c", "EdgeColor", "b");
% Creates the labels for the histogram
title("Age Distribution");
xlabel("Age");
ylabel("Students");
