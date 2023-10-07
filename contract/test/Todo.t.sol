// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Test, console } from "forge-std/Test.sol";
import { Todo } from "../src/Todo.sol"; 

contract TodoTest is Test {
    Todo public todo;

    function setUp() public {
        todo = new Todo();
    }

    function testCreateTodo() public {
        todo.create("My first todo");

        (string memory text, bool completed) = todo.get(0);

        assertEq(text, "My first todo");
        assertEq(completed, false);
    }

    function testUpdateText() public {
        todo.create("My first todo");
        todo.updateText(0, "Updated todo text");

        (string memory text, bool completed) = todo.get(0);

        assertEq(text, "Updated todo text");
        assertEq(completed, false);
    }

    function testToggleCompleted() public {
        todo.create("My first todo");

        // Initially, todo should be marked as not completed (false)
        (string memory text1, bool completed1) = todo.get(0);
        assertEq(completed1, false);

        // Toggle completed status
        todo.toggleCompleted(0);

        // Todo should now be marked as completed (true)
        (string memory text2, bool completed2) = todo.get(0);
        assertEq(completed2, true);
    }
}
