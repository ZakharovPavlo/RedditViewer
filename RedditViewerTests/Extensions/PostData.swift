//
//  PostData.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
@testable import RedditViewer

extension PostsData {
    static func random() -> PostsData {
        return PostsData(modhash: randomString(maxLength: 30), dist: randomInt(), children: [Child.random()], after: randomString(maxLength: 30), before: randomOptionalString(maxLength: 30))
    }
}
