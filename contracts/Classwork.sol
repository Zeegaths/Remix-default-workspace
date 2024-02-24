//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract School {
    Student[] public members;
    uint disabledCount;

    event StudentRegistered(address studentAddress, uint data);

    function registerStudent(uint data, string memory name, uint8 age) external {
        Student student = new Student(data, name, age, members.length);
        members.push(student);
        emit StudentRegistered(address(student), data);
    }

    function getStudents() external view returns(Student[] memory _members) {
        _members = new Student[](members.length - disabledCount);
        uint count;
        for (uint i = 0; i < members.length; i++) {
            if (members[i].isEnabled()) {
                _members[count] = members[i];
                count++;
            }
        }
    }  

    function disable(Student student) external {
        members[student.index()].disable();
        disabledCount++;
    }
}


contract Student {
    uint data;
    string Name;
    uint8 Age;
    address Account;
    bool public isEnabled;
    uint public index;

    constructor(uint _data, string memory _name, uint8 _age, uint _index) {
        data = _data;
        Name = _name;
        Age = _age;       
        isEnabled = true; 
        index = _index;
    }

    function disable() external {
        isEnabled = false;
    }
}














// 

// contract School {
//     enum Rank {
//         Principle,
//         Teacher,
//         Student
//     }

//     struct Person {       
//         string Name;
//         uint Age;
//         uint Score; 
//         address Account;
//         Rank rank;
//     }
    

//     address public principle;
    

//     mapping(address => mapping(Rank => Person)) private database;  

//     constructor() {
//         principle = msg.sender;
//     }


//     modifier onlyPrinciple {
//         require(principle == msg.sender, "Only principle have full access");
//         _;
//     } 

//     modifier onlyTeacher {
//         require(database[msg.sender][Rank.Teacher].Account == msg.sender, "Only teacher can update score");
//         _;
//     } 

//     function registerStudent (address _studentAddress, string memory _name, uint _age, uint _score) onlyPrinciple public {        
//         database[_studentAddress][Rank.Student] = Person(_name, _age, _score, _studentAddress, Rank.Student);
        
//     }

//     function registerTeacher (address _teacherAddress, string memory _name, uint _age, uint _Score) public onlyPrinciple { 
//         database[_teacherAddress][Rank.Teacher] = Person(_name, _age, _Score, _teacherAddress, Rank.Teacher);        
//     }
  

//     function updateScore(address _studentAddress, uint sscore) public onlyTeacher {
//         database[_studentAddress][Rank.Student].Score = sscore;                       
//     }


//     function removeTeacher( address _teacherAddress) public onlyPrinciple {        
//         database[_teacherAddress][Rank.Teacher].Account = _teacherAddress;
//         delete(_teacherAddress);      

//     }
    
// }



