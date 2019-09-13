//
//  ThumbnailLoaderProtocol.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

protocol ThumbnailLoaderProtocol {
    func setThumbnailFrom(urlString: String, toImageView imageView: UIImageView)
}
