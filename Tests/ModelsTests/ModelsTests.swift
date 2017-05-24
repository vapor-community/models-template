import XCTest
@testable import Models

class ModelsTests: XCTestCase {
    static let allTests = [
        ("testPost", testPost),
    ]

    func testPost() throws {
        let raw = "{\"id\":\"1234-12ab-1235-aaaa\",\"content\":\"Hello, World!\"}"
        let json = try JSON(bytes: raw.makeBytes())
        let post = try Post(json: json)
        XCTAssertEqual(post.id, Identifier.string("1234-12ab-1235-aaaa"))
        XCTAssertEqual(post.content, "Hello, World!")

        let serialized = try post.makeJSON().makeBytes().makeString()
        XCTAssertEqual(raw, serialized)
    }
}
