//
//  APIService.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation

typealias ErrorCallback = (APIError) -> Void

typealias TopPostsCallback = (Posts) -> Void

class APIService: APIServiceProtocol {
    let baseUrl = "https://www.reddit.com"

    let session = URLSession.shared

    func getTopPosts(after: String?, onSuccess: @escaping TopPostsCallback,
                     onError: ErrorCallback?) {
        makeHTTPGetRequest(request: .top(after: after), onSuccess: { data in
            guard let posts = try? JSONDecoder().decode(Posts.self, from: data) else {
               onError?(.malformedJson)
               return
            }

            onSuccess(posts)
        }, onError: onError)
    }

    private func makeHTTPGetRequest(request: APIRequest,
                                       data: Data? = nil,
                                       onSuccess: ((Data) -> Void)?,
                                       onError: ((APIError) -> Void)?) {
        let urlString = baseUrl + request.path

        guard let url = URL(string: urlString.toUrlQueryString()) else {
            onError?(.requestPathError)
            return
        }
        
        let request = URLRequest(url: url)
        runTaskWithRequest(request, onSuccess: onSuccess, onError: onError)
    }

    private func runTaskWithRequest(_ request: URLRequest,
                                    onSuccess: ((Data) -> Void)?,
                                    onError: ((APIError) -> Void)?) {
        let task = session.dataTask(with: request) { data, response, error in

            // check status code:
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode < 200 || httpResponse.statusCode >= 300 {
                    onError?(.httpError(statusCode: httpResponse.statusCode))
                    return
                }
            }

            // make sure we got data
            guard let responseData = data else {
                onError?(.noData)
                return
            }

            onSuccess?(responseData)
        }
        task.resume()
    }
}
