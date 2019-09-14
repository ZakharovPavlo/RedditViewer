//
//  APIRequest.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation

enum APIRequest {
    case top(after: String?)

    var path: String {
        switch self {
        case .top(let after):
            guard let after = after else { return "/top.json" }
            return "/top.json?after=\(after)"
        }
    }
}
