pragma solidity 0.4.19;

import "./Ownable.sol";

contract CatLives is Ownable {
    address public owner = msg.sender;
    uint Lives;

    function CatLives() {
        Lives = 8;

    }

    function IsAlive() returns (bool){
        if (Lives > 0) {
            return true;
        }
        return false;
    }

    function Die() public {
        require(IsAlive());

        Lives--;
    }

    function Meow() returns (string) {
        require(IsAlive());
        return "Meow!";
    }

    function LivesLeft() constant returns (uint) {
        return Lives;
    }
}
