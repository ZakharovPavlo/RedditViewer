//
//  APIServiceProtocol.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func getTopPosts(after: String?, onSuccess: @escaping TopPostsCallback,
                     onError: ErrorCallback?)
}
