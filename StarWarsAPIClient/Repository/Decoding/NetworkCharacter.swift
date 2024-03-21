/// Properties defined by https://akabab.github.io/starwars-api/
internal struct NetworkCharacter: Decodable {
    let id: Int
    let name: String
    let height: Double?
    let mass: Double?
    let gender: String?
    let wiki: String?
    let image: String?
    let born: VarDecodable<String, Int>?
    let bornLocation: String?
    let died: Int?
    let diedLocation: String?
    let dateCreated: Int?
    let dateDestroyed: Int?
    let destroyedLocation: String?
    let homeworld: VarDecodable<String, [String]>?
    let creator: String?
    let manufacturer: String?
    let model: String?
    let `class`: String?
    let species: String
    let cybernetics: VarDecodable<String, [String]>?
    let equipment: VarDecodable<String, [String]>?
    let hairColor: String?
    let eyeColor: String?
    let skinColor: String?
    let sensorColor: String?
    let platingColor: String?
    let affiliations: [String]
    let formerAffiliations: [String]
    let masters: VarDecodable<String, [String]>?
    let apprentices: VarDecodable<String, [String]>?
}

extension NetworkCharacter {
    func internalValue() -> Character {
        let massKG: Double? = if let mass = self.mass {
            Double(mass)
        } else {
            nil
        }
        
        let yearOfBirth: Character.YearOfBirth? = switch born {
        case .tValue(let description):
            .description(description)
        case .uValue(let year):
            .year(year)
        case .none:
            nil
        }
        
        return .init(
            id: self.id,
            name: self.name,
            heightM: self.height,
            massKG: massKG,
            gender: self.gender,
            homeworldNames: self.homeworld?.values() ?? [],
            wikiURL: self.wiki,
            imageURL: self.image,
            yearOfBirth: yearOfBirth,
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
            cybernetics: self.cybernetics?.values() ?? [],
            equipment: self.equipment?.values() ?? [],
            affiliationNames: self.affiliations,
            formerAffiliationNames: self.formerAffiliations,
            masterNames: self.masters?.values() ?? [],
            apprenticeNames: self.apprentices?.values() ?? []
        )
    }
}
