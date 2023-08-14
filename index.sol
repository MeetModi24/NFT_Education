// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract TokenContract is ERC721Enumerable, Ownable {
    // Structure for storing information
    struct TokenInfo {
        string name;
        uint256 dateOfBirth;
        string degreeName;
        string courseName;
        string instituteName;
        // Add any other information you want to store here
    }


    // Mapping from token ID to TokenInfo
    mapping(uint256 => TokenInfo) private _tokenInfo;


    // Counter for generating unique token IDs
    uint256 private _tokenIdCounter;


    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        _tokenIdCounter = 0;
    }


    // Function to mint a new token with information
    function mintToken(
        string memory name,
        uint256 dateOfBirth,
        string memory degreeName,
        string memory courseName,
        string memory instituteName
        // Add any other information you want to store here
    ) external onlyOwner {
        _mint(msg.sender, _tokenIdCounter);
        _tokenInfo[_tokenIdCounter] = TokenInfo(name, dateOfBirth, degreeName, courseName, instituteName);
        _tokenIdCounter++;
    }


    // Function to get information for a specific token
    function getTokenInfo(uint256 tokenId) external view returns (TokenInfo memory) {
        return _tokenInfo[tokenId];
    }
}
