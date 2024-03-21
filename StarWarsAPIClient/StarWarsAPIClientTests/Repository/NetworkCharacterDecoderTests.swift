import XCTest
@testable import StarWarsAPIClient

final class NetworkCharacterDecoderTests: XCTestCase {
    func testDecode_givenAllKnownValues_returnsCompleteList() throws {
        let dataPath =
        Bundle(for: type(of: self)).path(forResource: "all", ofType: "json")!
        let inputData = try Data(contentsOf: URL(fileURLWithPath: dataPath))
        
        let sut = NetworkCharacterDecoder()
        let result = try sut.decode(inputData)
        
        XCTAssertEqual(result.count, 42)
    }
}
