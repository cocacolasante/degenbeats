// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MusicNft is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //mapping of song struct to token id
    mapping(uint=>Song) public songs;


    struct Song{
        address creator;
        string songName;
        uint lastPrice;
        uint tokenId;
        bool forSale;
        
    }

    constructor()ERC721("DegenBeats", "DGB"){}

    function mintSong(string memory tokenUri, string memory _songName) public {
        _tokenIds.increment();
        uint currentToken = _tokenIds.current();

        _mint(msg.sender, currentToken);

        _setTokenURI(currentToken, tokenUri);

        Song memory newSong = Song(msg.sender, _songName, 0, currentToken, false );

        songs[currentToken] = newSong;
        



    }
}