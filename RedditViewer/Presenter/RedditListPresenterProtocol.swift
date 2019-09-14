//
//  RedditListPresenterProtocol.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

protocol RedditListPresenterProtocol {
    var posts: [ChildData] { get }

    func requestRedditData()

    func loadImage(withUrlString urlString: String, toImageView imageView: UIImageView)

    func tableViewDidScrollToEnd()
}
