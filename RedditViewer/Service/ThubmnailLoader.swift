//
//  ThubmnailStorage.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

class ThubmnailLoader: ThumbnailLoaderProtocol {
    private let queue = DispatchQueue(label: "thumbnailQueue")

    private var thumbnailsInMemoryCache = NSCache<NSString, UIImage>()

    func setThumbnailFrom(urlString: String, toImageView imageView: UIImageView) {
        let urlString = urlString as NSString

        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            var thubmnail: UIImage?
            self.queue.sync { [weak self] in
                guard let self = self else { return }
                thubmnail = self.thumbnailsInMemoryCache.object(forKey: urlString)
            }

            if let thubmnail = thubmnail {
                self.setImage(thubmnail, toImageView: imageView)
                return
            }

            guard let url = URL(string: urlString as String),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) else {
                    self.setImage(UIImage.placeholder(), toImageView: imageView, contentMode: .scaleToFill)
                    return
            }

            self.queue.sync { [weak self] in
                guard let self = self else { return }
                self.thumbnailsInMemoryCache.setObject(image, forKey: urlString)
            }
            
            self.setImage(image, toImageView: imageView)
        }
    }

    private func setImage(_ image:UIImage, toImageView imageView: UIImageView, contentMode: UIView.ContentMode = .scaleAspectFill) {
        DispatchQueue.main.async {
            imageView.contentMode = contentMode
            imageView.image = image
        }
    }
}
