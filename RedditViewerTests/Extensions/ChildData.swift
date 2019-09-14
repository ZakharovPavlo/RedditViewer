//
//  ChildData.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
@testable import RedditViewer

extension ChildData {
    static func random() -> ChildData {
        return ChildData(title: randomString(maxLength: 30),
                         thumbnail: randomString(maxLength: 30),
                         thumbnailWidth: randomOptionalInt(),
                         thumbnailHeight: randomInt(),
                         created: randomInt(),
                         author: randomString(maxLength: 30),
                         numComments: randomInt(),
                         url: randomString(maxLength: 30),
                         createdUTC: randomInt())
    }
}
