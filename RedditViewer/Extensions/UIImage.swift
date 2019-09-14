//
//  UIImage.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static func placeholder() -> UIImage {
        return UIImage(named: "noImage") ?? UIImage()
    }
}
