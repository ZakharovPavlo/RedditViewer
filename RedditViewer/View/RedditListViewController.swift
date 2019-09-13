//
//  RedditListViewController.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

protocol RedditListViewControllerDelegate: class {
    func didSelectPost(post: ChildData)
}

class RedditListViewController: UIViewController, RedditListViewProtocol {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter: RedditListPresenterProtocol!

    weak var delegate: RedditListViewControllerDelegate?

    fileprivate enum Constants {
        static let cellReuseId = "redditPostCell"
        static let redditPostCellNibName = "RedditPost"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        activityIndicator.startAnimating()
        presenter.requestRedditData()
    }

    func showError(error: APIError) {
        activityIndicator.stopAnimating()
        let alertVC = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }

    func reloadData() {
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
}

extension RedditListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseId, for: indexPath) as? PostCell else { return UITableViewCell () }
        let post = presenter.posts[indexPath.row]
        cell.setUpWith(post: post)
        presenter.loadImage(withUrlString: post.thumbnail, toImageView: cell.thumbnailImageView)
        return cell
    }
}

extension RedditListViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard tableView.numberOfRows(inSection: 0) != 0 else { return }
        let isReachingEnd = scrollView.contentOffset.y >= 0
            && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
        if isReachingEnd && !presenter.isUpdatingData {
            activityIndicator.startAnimating()
            presenter.requestRedditData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = presenter.posts[indexPath.row]
        delegate?.didSelectPost(post: post)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
