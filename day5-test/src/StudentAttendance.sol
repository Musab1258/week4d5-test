// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

contract StudentAttendance {
    // Define Student struct
    struct Student {
        string name;
        uint256 age;
        bool present;
    }
    
    // State variable: array to store all students
    Student[] public students;
    
    // Events
    event StudentAdded(uint256 indexed studentId, string name, uint256 age);
    event AttendanceUpdated(uint256 indexed studentId, bool present);
    
    // Function to add a new student
    function addStudent(string memory _name, uint256 _age) public {
        Student memory newStudent = Student({
            name: _name,
            age: _age,
            present: false  // Initially marked as absent
        });
        
        students.push(newStudent);
        
        // Emit event with the student ID (array index)
        emit StudentAdded(students.length - 1, _name, _age);
    }
    
    // Function to update attendance for an existing student
    function updateAttendance(uint256 _studentId, bool _present) public {
        require(_studentId < students.length, "Student does not exist");
        
        students[_studentId].present = _present;
        
        // Emit event
        emit AttendanceUpdated(_studentId, _present);
    }
    
    // Helper function to get total number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }
    
    // Helper function to get student details
    function getStudent(uint256 _studentId) public view returns (string memory name, uint256 age, bool present) {
        require(_studentId < students.length, "Student does not exist");
        
        Student memory student = students[_studentId];
        return (student.name, student.age, student.present);
    }
}