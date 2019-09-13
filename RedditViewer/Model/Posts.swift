// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let posts = try? newJSONDecoder().decode(Posts.self, from: jsonData)

import Foundation

// MARK: - Posts
struct Posts: Codable {
    let kind: String
    let data: PostsData
}

// MARK: - PostsData
struct PostsData: Codable {
    let modhash: String
    let dist: Int
    let children: [Child]
    let after: String
    let before: String?
}

// MARK: - Child
struct Child: Codable {
    let data: ChildData
}

// MARK: - ChildData
struct ChildData: Codable {
    let title: String
    let thumbnail: String
    let created: Int
    let author: String
    let numComments: Int
    let url: String
    let createdUTC: Int
    let preview: Preview?

    var hoursFromNow: Int {
        let dateInt = createdUTC
        let cal = Calendar.current
        let d1 = Date()
        let d2 = Date(timeIntervalSince1970: TimeInterval(integerLiteral: Int64(dateInt)))
        let components = cal.dateComponents([.hour], from: d2, to: d1)
        return components.hour ?? 0
    }

    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail
        case created
        case author
        case numComments = "num_comments"
        case url
        case preview
        case createdUTC = "created_utc"
    }
}

// MARK: - Preview
struct Preview: Codable {
    let images: [Image]
    let enabled: Bool

    enum CodingKeys: String, CodingKey {
        case images, enabled
    }
}

// MARK: - Image
struct Image: Codable {
    let source: ResizedIcon
}

// MARK: - ResizedIcon
struct ResizedIcon: Codable {
    let url: String
    let width, height: Int
}
