/// Properties defined by https://akabab.github.io/starwars-api/
internal struct NetworkCharacter: Decodable {
    let id: Int
    let name: String
    let height: Double
    let mass: Int
    let gender: String
    let homeworld: String
    let wiki: String
    let image: String
    let born: Int
    let bornLocation: String
    let died: Int
    let diedLocation: String
    let species: String
    let hairColor: String
    let eyeColor: String
    let skinColor: String
    let cybernetics: String
    let affiliations: [String]
    let masters: [String]
    let apprentices: [String]
    let formerAffiliations: [String]
}

extension NetworkCharacter {
    func internalType() -> Character {
        return .init(
            id: self.id,
            name: self.name,
            heightM: self.height,
            massKG: Double(self.mass),
            gender: self.gender,
            homeworldName: self.homeworld,
            wikiURL: self.wiki,
            imageURL: self.image,
            yearOfBirth: self.born,
            placeOfBirthName: self.bornLocation,
            yearOfDeath: self.died,
            placeOfDeathName: self.diedLocation,
            speciesName: self.species,
            hairColor: self.hairColor,
            eyeColor: self.eyeColor,
            cybernetics: self.cybernetics,
            affiliationNames: self.affiliations,
            formerAffiliationNames: self.formerAffiliations,
            masterNames: self.masters,
            apprenticeNames: self.apprentices
        )
    }
}
