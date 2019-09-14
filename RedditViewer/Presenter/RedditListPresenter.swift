//
//  ReddiListPresenter.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

class RedditListPresenter: RedditListPresenterProtocol {
    private var apiService: APIServiceProtocol

    private var thumbnailLoader: ThumbnailLoaderProtocol

    private var after: String?

    var posts = [ChildData]()

    private var isUpdatingData = false

    weak var view: RedditListViewProtocol?

    init(apiService: APIServiceProtocol, thumbnailLoader: ThumbnailLoaderProtocol) {
        self.apiService = apiService
        self.thumbnailLoader = thumbnailLoader
    }

    func requestRedditData() {
        isUpdatingData = true
        apiService.getTopPosts(after: after, onSuccess: { [weak self] data in
            self?.parsePostsData(allPostsData: data)
            self?.isUpdatingData = false
            DispatchQueue.main.async {
                self?.view?.reloadData()
            }
        }) { [weak self] error in
            self?.isUpdatingData = false
            DispatchQueue.main.async {
                self?.view?.showError(error: error)
            }
        }
    }

    func loadImage(withUrlString urlString: String, toImageView imageView: UIImageView) {
        thumbnailLoader.setThumbnailFrom(urlString: urlString, toImageView: imageView)
    }

    func tableViewDidScrollToEnd() {
        if !isUpdatingData {
            view?.animateSpinner()
            requestRedditData()
        }
    }

    private func parsePostsData(allPostsData: Posts) {
            let postsData = allPostsData.data.children.map({ $0.data })
            self.posts += postsData
            after = allPostsData.data.after
    }
}
