public final class Post: Extendable {
    public var id: Identifier?
    /// The content of the post
    public var content: String
    public var extend: [String: Any]

    /// Creates a new Post
    public init(id: Identifier? = nil, content: String) {
        self.id = id
        self.content = content
        self.extend = [:]
    }
}

// MARK: JSON
// How the model converts from / to JSON.
// For example when:
//     - Creating a new Post (POST /posts)
//     - Fetching a post (GET /posts, GET /posts/:id)
//
extension Post: JSONConvertible {
    public convenience init(json: JSON) throws {
        try self.init(
            id: json.get("id"),
            content: json.get("content")
        )
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("content", content)
        return json
    }
}
