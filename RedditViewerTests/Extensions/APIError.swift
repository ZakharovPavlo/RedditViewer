//
//  APIError.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
@testable import RedditViewer

extension APIError {
    static func random() -> APIError {
        return APIError.allCases.randomElement() ?? .noData
    }
}
