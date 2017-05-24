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
extension Post: NodeConvertible {
    public convenience init(node: Node) throws {
        try self.init(
            id: node.get("id"),
            content: node.get("content")
        )
    }

    public func makeNode(in context: Context?) throws -> Node {
        var json = Node(context)
        try json.set("id", id)
        try json.set("content", content)
        return json
    }
}

extension Post: JSONConvertible {
    public convenience init(json: JSON) throws {
        try self.init(node: json)
    }

    public func makeJSON() throws -> JSON {
        var json = try converted(in: jsonContext) as JSON
        try json.set("special-json-only-addition", "hello")
        return json
    }
}
