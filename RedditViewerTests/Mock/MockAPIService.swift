//
//  MockAPIService.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
@testable import RedditViewer

class MockApiService: APIServiceProtocol {
    var postsResult: Posts?

    var errorResult: APIError?

    func getTopPosts(after: String?, onSuccess: @escaping TopPostsCallback, onError: ErrorCallback?) {
        if let postsResult = postsResult {
            onSuccess(postsResult)
        } else if let errorResult = errorResult {
            onError?(errorResult)
        }
    }
}
