//
//  MockRedditListView.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
@testable import RedditViewer

class MockRedditListView: RedditListViewProtocol {
    var showErrorInvocation: ((_ error: APIError) -> Void)?

    var reloadDataInvocation: (() -> Void)?

    var animateSpinnerInvocation: (() -> Void)?

    func showError(error: APIError) {
        showErrorInvocation?(error)
    }

    func reloadData() {
        reloadDataInvocation?()
    }

    func animateSpinner() {
        animateSpinnerInvocation?()
    }
}
