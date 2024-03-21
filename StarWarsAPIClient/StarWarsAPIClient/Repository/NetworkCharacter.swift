/// Properties defined by https://akabab.github.io/starwars-api/
internal struct NetworkCharacter: Decodable {
    let id: Int
    let name: String
    let height: Double?
    let mass: Double?
    let gender: String?
    let wiki: String?
    let image: String?
    let bornLocation: String?
    let died: Int?
    let diedLocation: String?
    let dateCreated: Int?
    let dateDestroyed: Int?
    let destroyedLocation: String?
    let creator: String?
    let manufacturer: String?
    let model: String?
    let `class`: String?
    let species: String
    let hairColor: String?
    let eyeColor: String?
    let skinColor: String?
    let sensorColor: String?
    let platingColor: String?
    let affiliations: [String]
    let formerAffiliations: [String]
}

extension NetworkCharacter {
    func internalType() -> Character {
        let massKG: Double? = if let mass = self.mass {
            Double(mass)
        } else {
            nil
        }
        
        return .init(
            id: self.id,
            name: self.name,
            heightM: self.height,
            massKG: massKG,
            gender: self.gender,
            homeworldNames: [], // TODO: #9
            wikiURL: self.wiki,
            imageURL: self.image,
            yearOfBirth: nil, // TODO: #9
            placeOfBirthName: self.bornLocation,
            yearOfDeath: self.died,
            placeOfDeathName: self.diedLocation,
            yearOfCreation: self.dateCreated,
            creatorName: self.creator,
            manufacturerName: self.manufacturer,
            yearOfDestruction: self.dateDestroyed,
            placeOfDestruction: self.destroyedLocation,
            speciesName: self.species,
            model: self.model,
            class: self.class,
            hairColor: self.hairColor,
            eyeColor: self.eyeColor,
            sensorColor: self.sensorColor,
            platingColor: self.platingColor,
            cybernetics: [], // TODO: #9
            equipment: [], // TODO: #9
            affiliationNames: self.affiliations,
            formerAffiliationNames: self.formerAffiliations,
            masterNames: [], // TODO: #9
            apprenticeNames: [] // TODO: #9
        )
    }
}
