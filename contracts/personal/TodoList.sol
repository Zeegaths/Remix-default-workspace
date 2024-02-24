// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TodoList {
    struct Tasks{ 
        string title;
        string description;
        bool isdone;
    }

    Tasks [] public taskList;

    function addTask (string memory _title, string memory _description) external {
        Tasks memory tasks;
        tasks.title = _title;
        tasks.description = _description;
        taskList.push(tasks);
    }

    function updateTask(uint _index,  string memory _title, string memory _description)  external {
        taskList[_index] = Tasks(_title, _description, false);
    }

    function getTask () external view returns (Tasks[] memory){
        return taskList;
    }


    function toggleTask(uint _index) external {
        taskList[_index].isdone = !taskList[_index].isdone;
    }

    function deleteTask(uint _index) external {
        delete taskList[_index];
    }
}