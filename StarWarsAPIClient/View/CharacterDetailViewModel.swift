import Foundation

internal class CharacterDetailViewModel {
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    lazy var formattedName: String = {
        self.character.name
    }()
    
    lazy var imageURL: URL? = {
        return if let imageURL = character.imageURL {
            URL(string: imageURL)
        } else {
            nil
        }
    }()
    
    lazy var labeledHeight: String? = {
        return if let heightM = self.character.heightM {
            localizedString(for: "character_height_m_format", heightM)
        } else {
            nil
        }
    }()
    
    lazy var labeledMass: String? = {
        return if let massKG = self.character.massKG {
            localizedString(for: "character_mass_kg_format", massKG)
        } else {
            nil
        }
    }()
}

fileprivate func localizedString(for key: String, _ arguments: CVarArg...)
-> String {
    String(format: NSLocalizedString(key, comment: ""), arguments: arguments)
}
