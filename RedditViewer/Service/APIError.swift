//
//  APIError.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation

enum APIError: CustomStringConvertible {
    case httpError(statusCode: Int)
    case noData
    case requestPathError
    case malformedJson

    var description: String {
        switch self {
        case .httpError(let statusCode):
            return "HTTP Error \(statusCode) please try again later"

        case .noData:
            return "No data received please try again later"

        case .requestPathError:
            return "Malformed request, please try again later"

        case .malformedJson:
            return "Malformed data, please try again later"
        }
    }
}
