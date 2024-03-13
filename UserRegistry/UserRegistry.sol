// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserRegistry {
    struct User {
        string username;
        string email;
        string phoneNumber;
        string profileImage;
        uint256 reputation;
    }

    mapping(address => User) public users;

    event UserRegistered(address indexed userAddress, string username);

    function registerUser(string memory _username, string memory _email, string memory _phoneNumber, string memory _profileImage, uint256 _reputation) public {
        require(bytes(_username).length > 0, "Username cannot be empty");
        require(bytes(_email).length > 0, "Email cannot be empty");

        // Create a new User struct
        User memory newUser = User({
            username: _username,
            email: _email,
            phoneNumber: _phoneNumber,
            profileImage: _profileImage,
            reputation: _reputation
        });

        // Store the user information
        users[msg.sender] = newUser;

        // Emit an event for user registration
        emit UserRegistered(msg.sender, _username);
    }
}
