//
//  MockThumbnailLoader.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit
@testable import RedditViewer

class MockThumbnailLoader: ThumbnailLoaderProtocol {
    var resultImage: UIImage?

    func setThumbnailFrom(urlString: String, toImageView imageView: UIImageView) {
        if let resultImage = resultImage {
            imageView.image = resultImage
        }
    }
}
