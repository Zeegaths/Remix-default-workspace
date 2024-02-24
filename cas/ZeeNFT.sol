// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


interface IERC165 {
    // function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

interface IERC721 is IERC165 {
//     function balanceOf(address owner) external view returns (uint balance);

//     function ownerOf(uint tokenId) external view returns (address owner);

//     function approve(address to, uint tokenId) external;

//     function getApproved(uint tokenId) external view returns (address operator);

//     function setApprovalForAll(address operator, bool _approved) external;

//     function isApprovedForAll(address owner, address operator) external view returns(bool);

//     function transferFrom(address from, address to, uint tokenId) external;

//     function safeTransferFrom(address from, address to, uint tokenId) external;

//     function safeTransferFrom(address from, address to, uint tokenId, bytes calldata data) external;


 
}


contract ZeeNFT is IERC721{
    event Transfer(address indexed from, address indexed to, uint indexed id);
    event Approval(address indexed owner, address indexed spender, uint indexed id);
    event ApprovalForAll(address indexed owner, address indexed spender, bool approved);      
    

    mapping(uint => address) internal _ownerOf;
    mapping(address => uint) internal _balanceOf;
    mapping(uint => address) internal _approvals;
    mapping(address => mapping(address => bool)) public _isApprovedForAll;

    //functions

    function supportsInterface(bytes4 interfaceID) external view returns(bool) {
        return interfaceId == type(IERC721.interfaceId) || interfaceId == type(IERC165.interfaceId);
    }

    function balanceOf(address owner) external view returns(uint) {
        require(owner != address(0), "address = zero");
        return _balanceOf[owner];
    }

    function ownerOf(uint tokenId) external view returns(address owner) {
         require (owner != address(0));
         owner = _ownerOf[tokenId];
    }

    function setApprovalForAll(address operator, bool _approved) external {
        _isApprovedForAll[msg.sender][operator] = _approved;
        emit ApprovalForAll(msg.sender, operator, _approved);
    }

    function approve(address spender, uint tokenId) external{
        address owner = _ownerOf[tokenId];
        require(msg.sender == owner || _isApprovedForAll[owner][spender] , "you cannot spend this NFT");
        _approvals[tokenId] = spender;

        emit Approval(msg.sender, spender, tokenId);
    }

    function getApproved(uint tokenId) external returns (address operator) {
        require (_ownerOf[tokenId] != address(0));
        return _approvals[tokenId];
    }

    function isApprovedOrOwner(address owner, address spender, uint tokenId) internal view returns (bool) {
        return(spender == _ownerOf(tokenId) || spender == _isApprovedForAll[owner][spender] || owner == _approvals[tokenId]);       

    }

    function transferFrom(address from, address to, uint tokenId) public {
        require(from == _ownerOf[tokenId], "not owner");
        require(to != address(0), "address = zero");
        require(isApprovedOrOwner(from, msg.sender, tokenId), "approved");


    }


}