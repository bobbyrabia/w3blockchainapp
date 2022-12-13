
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract ContratoCompraVenta {
    uint256 public tasksCounter = 0;
    struct Persona{
        string id_persona;
        string nombre;
        string addressPersona;

    }
    struct Contrato {
        
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt;
    }

    event TaskCreated(
        uint256 id,
        string title,
        string description,
        bool done,
        uint256 createdAt
    );
    event TaskToggledDone(uint256 id, bool done);

    mapping(uint256 => Contrato) public tasks;

    constructor() {
        createTask("my first task", "my first description");
    }

    function createTask(string memory _title, string memory _description)
        public
    {
        
        tasksCounter++;
        tasks[tasksCounter] = Contrato(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
        emit TaskCreated(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    }

    function toggleDone(uint256 _id) public {
        Contrato memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggledDone(_id, _task.done);
    }
}