// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StoredCalculator {

    int256 public number1;
    int256 public number2;
    string public operation;

    // ✅ Set two numbers and the operation (e.g., "add", "subtract")
    function setInputs(int256 _num1, int256 _num2, string memory _operation) public {
        number1 = _num1;
        number2 = _num2;
        operation = _operation;
    }

    // ✅ Calculate result based on stored inputs
    function calculate() public view returns (int256) {
        bytes32 opHash = keccak256(abi.encodePacked(operation));

        if (opHash == keccak256("add")) {
            return number1 + number2;
        } else if (opHash == keccak256("subtract")) {
            return number1 - number2;
        } else if (opHash == keccak256("multiply")) {
            return number1 * number2;
        } else if (opHash == keccak256("divide")) {
            require(number2 != 0, "Cannot divide by zero");
            return number1 / number2;
        } else {
            revert("Invalid operation. Use 'add', 'subtract', 'multiply', or 'divide'");
        }
    }

    // ✅ Show available operations (for front-ends or users)
    function getAvailableOperations() public pure returns (string memory) {
        return "Available operations: add, subtract, multiply, divide";
    }
}
