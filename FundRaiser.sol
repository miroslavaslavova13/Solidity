// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract FundRaiser {
    uint256 public totalShares;
    mapping(address => uint256) public shares;
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function addShares(address receiver, uint256 amount) external {
        require(msg.sender == owner, "Not owner");
        totalShares += amount;
        shares[receiver] += amount;
    }

    function buyShares() public payable {
        // 1 share == 1 wei
        shares[msg.sender] += msg.value;
        shares[owner] -= msg.value;
    }

    // Shareholders can check what part of the business they own
    function getShares(address shareholder)
        external
        view
        returns (uint256, uint256)
    {
        return (shares[shareholder], totalShares);
    }

    // shows the adress where the current  function call came from
    function whoAmI() public view returns (address) {
        return msg.sender;
    }

    // the address of the instance of the contract where the call is being made (our adress)
    function who() public view returns (address) {
        return address(this);
    }

       // how to write enum
    enum Options {
        One,
        Two, 
        Three
    }

    function getEnum(Options option) external pure returns (Options){
        return option;
    }

    // declaration of errors and adding of parameters
    error Unauthorized(string reason);
}
