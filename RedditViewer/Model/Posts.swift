//
//  Posts.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

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
struct ChildData: Codable, Equatable {
    let title: String
    let thumbnail: String
    let thumbnailWidth: Int?
    let thumbnailHeight: Int?
    let created: Int
    let author: String
    let numComments: Int
    let url: String
    let createdUTC: Int

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
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
        case created
        case author
        case numComments = "num_comments"
        case url
        case createdUTC = "created_utc"
    }
}
