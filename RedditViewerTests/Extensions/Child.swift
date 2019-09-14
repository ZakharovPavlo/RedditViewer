//
//  Child.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
@testable import RedditViewer

extension Child {
    static func random() -> Child {
        return Child(data: ChildData.random())
    }
}
