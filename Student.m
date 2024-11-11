% Author Name: Sydnie Oliva
% Email: Olivas22@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Date: 11/11/24


% Creates the Student class and defines it
classdef Student
    properties
        ID
        Name
        Age
        GPA
        Major
    end
    
    methods
        % % Creates a function that contains the student class with the
        % properties listed above
        function res = Student(ID, Name, Age, GPA, Major)
            if nargin > 0
                res.ID = ID;
                res.Name = Name;
                res.Age = Age;
                res.GPA = GPA;
                res.Major = Major;
            end
        end
        
        % Displays the students information
        function info = displayInfo(res)
            info = sprintf("ID: %s, Name: %s, Age: %d, GPA: %.2f, Major: %s", ...
                res.ID, res.Name, res.Age, res.GPA, res.Major);
        end
        
        % Creates a function that updates the GPA
        function res = updateGPA(res, newGPA)
            % If the GPA is within the paramiters of more than 0 but less
            % than 4 the code will add the new GPA
            if newGPA >= 0 && newGPA <= 4
                res.GPA = newGPA;
                % If the GPA is not within 0 and 4 the message below will
                % display
            else
                error("GPA must be between 0 and 4");
            end
        end
    end
end
