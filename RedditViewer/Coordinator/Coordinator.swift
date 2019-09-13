//
//  Coordinator.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var context: UIViewController { get }
    func start()
    func stop()
}
