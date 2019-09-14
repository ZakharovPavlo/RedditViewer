//
//  AppCoordinator.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class AppCoordinator: NSObject, Coordinator {
    var context: UIViewController

    var childCoordinator: Coordinator?

    var lastLinkStorage: LastLinkStorageProtocol
    
    init(context: UIViewController) {
        self.context = context
        self.lastLinkStorage = LastLinkStorage()
    }

    func applicationWillTerminate() {
        lastLinkStorage.storeLastLink()
    }

    func start() {
        let redditListCoordinator = RedditListCoordinator(context: context, lastLinkStorage: lastLinkStorage)
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
    func redditListCoordinatorDidStop(redditListCoordinator: RedditListCoordinator) {
        childCoordinator = nil
    }
}
