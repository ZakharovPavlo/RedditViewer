//
//  RedditListCoordinator.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

protocol RedditListCoordinatorDelegate: class {
    func didStop()
}

class RedditListCoordinator: NSObject, Coordinator {
    var context: UIViewController

    var apiService: APIServiceProtocol

    var thumbmnailLoader: ThumbnailLoaderProtocol

    weak var delegate: RedditListCoordinatorDelegate?

    private weak var presentedViewController: RedditListViewController?

    private var childCoordinator: Coordinator?

    private var lastLinkStorage: LastLinkStorage

    init(context: UIViewController, lastLinkStorage: LastLinkStorage) {
        self.context = context
        self.lastLinkStorage = lastLinkStorage
        apiService = APIService()
        thumbmnailLoader = ThubmnailLoader()
    }

    func start() {
        let sb = UIStoryboard(name: GlobalConstants.redditListStoryboard, bundle: Bundle.main)
        if let vc = sb.instantiateInitialViewController() as? RedditListViewController {
            presentedViewController = vc
            presentedViewController?.delegate = self
            let presenter = RedditListPresenter(apiService: self.apiService, thumbnailLoader: thumbmnailLoader)
            presenter.view = vc
            vc.presenter = presenter
            (context as? UINavigationController)?.pushViewController(vc, animated: true, completion: { [weak self] in
                if let lastLink = self?.lastLinkStorage.getLink() {
                    self?.showDetailsCoordinatorWithUrl(url: lastLink)
                }
            })
        }
    }

    func stop() {
        presentedViewController = nil
        delegate?.didStop()
    }
}

extension RedditListCoordinator: RedditListViewControllerDelegate {
    func didSelectPost(post: ChildData) {
        _ = post.preview?.images.first?.source.url
        /* This Urls for some reason doesnt work and any of preview urls gives 403 Forbidden error
        So i decided to show post url itself */
        lastLinkStorage.lastLink = post.url
        showDetailsCoordinatorWithUrl(url: post.url)
    }

    func showDetailsCoordinatorWithUrl(url: String) {
        guard let presentedViewController = presentedViewController else { return }
        let detailCoordinator = DetailCoordinator(context: presentedViewController, selectedItemUrlString: url)
        childCoordinator = detailCoordinator
        detailCoordinator.delegate = self
        detailCoordinator.start()
    }
}

extension RedditListCoordinator: DetailCoordinatorDelegate {
    func didStop() {
        lastLinkStorage.lastLink = nil
        childCoordinator = nil
    }
}
