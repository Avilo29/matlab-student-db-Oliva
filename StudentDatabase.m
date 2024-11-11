% Author Name: Sydnie Oliva
% Email: Olivas22@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Date: 11/11/24


% Creates the StudentDatabase class and defines it
classdef StudentDatabase
    properties
        students
    end
    
    methods
        % Creates an empty array called students
        function res = StudentDatabase()
            res.students = [];
        end
        
        % A function that adds new students
        function res = addStudent(res, student)
            res.students = [res.students, student];
        end
        
        % Finds a student by their ID
        function student = findStudentByID(res, studentID)
            student = [];
            for i = 1:length(res.students)
                % If the ID is found it will print the students information
                if res.students(i).ID == studentID
                    student = res.students(i);
                    return;
                end
            end
        end
        
        % Gets list of students by their major
        function majorStudents = getStudentsByMajor(res, Major)
            majorStudents = [];
            for i = 1:length(res.students)
                if strcmp(res.students(i).Major, Major)
                    majorStudents = [majorStudents, res.students(i)];
                end
            end
        end
        
        % Saves the database to a .mat file
        function saveToFile(res, file_name)
            % Saves each of the properties to the file
            studentData = struct();
            studentData.ID = [res.students.ID];
            studentData.Name = {res.students.Name};
            studentData.Age = [res.students.Age];
            studentData.GPA = [res.students.GPA];
            studentData.Major = {res.students.Major};
            % Saves the information to the file
            try
                save(file_name, "-struct", "studentData");
                disp(["Database saved to ", file_name]);
                % If an error occurs it will display the message below
            catch
                error("Error saving database to file");
            end
        end
        
        % Loads database from a .mat file
        function res = loadFromFile(res, file_name)
            if exist(file_name, "file")
                try
                    loadedData = load(file_name);
                    res.students = [];
                    % Calls all the properties in the file
                    for i = 1:length(loadedData.ID)
                        student = Student(loadedData.ID(i), loadedData.Name{i}, ...
                                          loadedData.Age(i), loadedData.GPA(i), loadedData.Major{i});
                        res = res.addStudent(student);
                    end
                    % Shows the database from the file
                    disp(["Database loaded from ", file_name]);
                    % If an error occurs the message below will pop up
                catch
                    error("Error loading database from file");
                end
                % If the requirments of the if statement, the file existing" are not met the
                % message below will show
            else
                error("File does not exist");
            end
        end
    end
end
