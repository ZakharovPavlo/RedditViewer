//
//  Posts.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
@testable import RedditViewer

extension Posts {
    static func random() -> Posts {
        return Posts(kind: randomString(maxLength: 30), data: PostsData.random())
    }
}
