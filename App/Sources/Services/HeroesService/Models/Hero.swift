struct Hero {

    let identifier: Int
    let name: String
    let gender: Gender
    let status: Status
    let image: String
}

// MARK: - Decodable

extension Hero: Decodable {

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case gender
        case status
        case image
    }
}

// MARK: - Nested Types

extension Hero {

    enum Gender: String, Decodable {

        case female = "Female"

        case male = "Male"

        case genderless = "Genderless"

        case unknown = "Unknown"
    }

    enum Status: String, Decodable {

        case alive = "Alive"

        case dead = "Dead"

        case unknown = "Unknown"
    }
}
