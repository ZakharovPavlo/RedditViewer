//
//  DetailViewCoordinator.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

protocol DetailCoordinatorDelegate: class {
    func didStop()
}

class DetailCoordinator: NSObject, Coordinator {
    var context: UIViewController

    private var url: URL?

    weak var delegate: DetailCoordinatorDelegate?

    init(context: UIViewController, selectedItemUrlString: String) {
        self.context = context
        url = URL(string: selectedItemUrlString)
    }

    func start() {
        guard let url = url else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        context.present(safariViewController, animated: true, completion: nil)
    }

    func stop() {
        delegate?.didStop()
    }
}

extension DetailCoordinator: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.stop()
    }
}
