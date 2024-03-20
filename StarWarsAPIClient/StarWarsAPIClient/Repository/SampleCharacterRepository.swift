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
            homeworldName: "Sample Homeworld",
            wikiURL: "https://sample_url",
            imageURL:
                "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg",
            yearOfBirth: 10,
            placeOfBirthName: "Sample Birthplace",
            yearOfDeath: 100,
            placeOfDeathName: "Sample Homeworld",
            speciesName: "Sample Species",
            hairColor: "Sample Hair Color",
            eyeColor: "Sample Eye Color",
            cybernetics: "Sample Cybernetics",
            affiliationNames: ["Sample Affiliation"],
            formerAffiliationNames: ["Sample Former Affiliation"],
            masterNames: ["Sample Master"],
            apprenticeNames: ["Sample Apprentice"]
        )
    }
}
