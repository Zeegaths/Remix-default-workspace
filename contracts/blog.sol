// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleBlog {
    // Structure to represent a blog post
    struct BlogPost {
        uint256 id;
        address author;
        string title;
        string content;
    }

    // Mapping to store blog posts with their IDs
    mapping(uint256 => BlogPost) private blogPosts;

    // Counter to keep track of the next available ID
    uint256 private nextId;

    // Event to emit when a new blog post is created
    event BlogPostCreated(uint256 id, address author, string title, string content);

    // Function to create a new blog post
    function createBlogPost(string memory _title, string memory _content) public {
        uint256 id = nextId;
        address author = msg.sender;
        blogPosts[id] = BlogPost(id, author, _title, _content);
        nextId++;
        emit BlogPostCreated(id, author, _title, _content);
    }

    // Function to get the content of a blog post by ID
    function getBlogPost(uint256 _id) public view returns (uint256, address, string memory, string memory) {
        BlogPost memory post = blogPosts[_id];
        return (post.id, post.author, post.title, post.content);
    }
}
