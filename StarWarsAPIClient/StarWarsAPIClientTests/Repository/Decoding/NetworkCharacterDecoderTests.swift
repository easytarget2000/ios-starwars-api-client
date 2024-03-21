import XCTest
@testable import StarWarsAPIClient

final class NetworkCharacterDecoderTests: XCTestCase {
    func testDecode_givenAllKnownValues_returnsCompleteList() throws {
        let inputData = try self.allValuesData()
        
        let sut = NetworkCharacterDecoder()
        let result = try sut.decode(inputData)
        let expectedNumberOfEntries = 87
        
        XCTAssertEqual(result.count, expectedNumberOfEntries)
    }
    
    func testDecode_givenValueWithOneHomeworld_returnsCorrectHomeworld()
    throws {
        let inputData = try self.allValuesData()
        
        let sut = NetworkCharacterDecoder()
        let observedCharacter = try sut.decode(inputData).first { $0.id == 14 }!
        let result = observedCharacter.homeworld!.names()
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first!, "corellia")
    }
    
    func testDecode_givenValueWithMultipleHomeworlds_returnsCorrectHomeworlds()
    throws {
        let inputData = try self.allValuesData()
        
        let sut = NetworkCharacterDecoder()
        let observedCharacter = try sut.decode(inputData).first { $0.id == 15 }!
        let result = observedCharacter.homeworld!.names()
        
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0], "Rodia")
        XCTAssertEqual(result[1], "Tatooine")
    }
    
    private func allValuesData() throws -> Data {
        let dataPath =
        Bundle(for: type(of: self)).path(forResource: "all", ofType: "json")!
        return try Data(contentsOf: URL(fileURLWithPath: dataPath))
    }
}
