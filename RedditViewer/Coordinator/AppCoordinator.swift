//
//  AppCoordinator.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: NSObject, Coordinator {
    var context: UIViewController

    var childCoordinator: Coordinator?

    init(context: UIViewController) {
        self.context = context
    }

    func start() {
        let redditListCoordinator = RedditListCoordinator(context: context)
        redditListCoordinator.delegate = self
        childCoordinator = redditListCoordinator
        childCoordinator?.start()
    }

    func stop() {
        childCoordinator?.stop()
        childCoordinator = nil
    }
}

extension AppCoordinator: RedditListCoordinatorDelegate {
    func didStop() {
        print("Stop")
        childCoordinator = nil
    }
}
