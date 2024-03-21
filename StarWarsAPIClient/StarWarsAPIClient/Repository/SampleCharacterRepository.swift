internal final class SampleCharacterRepository: CharacterRepository {
    var numberOfQueryResults: Int = 10
    
    func query() -> [Character] {
        return (0 ..< self.numberOfQueryResults).map {
            Self.nextCharacter(id: $0)
        }
    }
    
    static func nextCharacter(id: Int) -> Character {
        return .init(
            id: id,
            name: "Sample Name \(id)",
            heightM: 2.0,
            massKG: 100.0,
            gender: "Sample Gender",
            homeworldNames: ["Sample Homeworld"],
            wikiURL: "https://sample_url",
            imageURL:
                "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg",
            yearOfBirth: .year(10),
            placeOfBirthName: "Sample Birthplace",
            yearOfDeath: 100,
            placeOfDeathName: "Sample Homeworld",
            yearOfCreation: nil,
            creatorName: nil,
            manufacturerName: nil,
            yearOfDestruction: nil,
            placeOfDestruction: nil,
            speciesName: "Sample Species",
            model: nil,
            class: nil,
            hairColor: "Sample Hair Color",
            eyeColor: "Sample Eye Color",
            sensorColor: nil,
            platingColor: nil,
            cybernetics: ["Sample Cybernetics"],
            equipment: ["Sample Equipment"],
            affiliationNames: ["Sample Affiliation"],
            formerAffiliationNames: ["Sample Former Affiliation"],
            masterNames: ["Sample Master"],
            apprenticeNames: ["Sample Apprentice"]
        )
    }
}
