internal struct Character: Identifiable {
    let id: Int
    let name: String
    let heightM: Double?
    let massKG: Double?
    let gender: String?
    let homeworldNames: [String]
    let wikiURL: String?
    let imageURL: String?
    let yearOfBirth: YearOfBirth?
    let placeOfBirthName: String?
    let yearOfDeath: Int?
    let placeOfDeathName: String?
    let yearOfCreation: Int?
    let creatorName: String?
    let manufacturerName: String?
    let yearOfDestruction: Int?
    let placeOfDestruction: String?
    let speciesName: String?
    let model: String?
    let `class`: String?
    let hairColor: String?
    let eyeColor: String?
    let sensorColor: String?
    let platingColor: String?
    let cybernetics: [String]
    let equipment: [String]
    let affiliationNames: [String]
    let formerAffiliationNames: [String]
    let masterNames: [String]
    let apprenticeNames: [String]
    
    enum YearOfBirth {
        case year(Int)
        case description(String)
    }
}
