//
//  RedditListPresenterTests.swift
//  RedditViewerTests
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import XCTest
@testable import RedditViewer

/*
 Due to the time constraints only presenter class is covered with tests
 Service classes and Coordinators can be covered with unit and UI tests in similar manner
 */

class RedditListPresenterTests: XCTestCase {

    var objectUnderTest: RedditListPresenter!

    var mockAPIService = MockApiService()

    var mockThumbnailLoader = MockThumbnailLoader()

    var mockView = MockRedditListView()

    override func setUp() {
        objectUnderTest = RedditListPresenter(apiService: mockAPIService, thumbnailLoader: mockThumbnailLoader)
        objectUnderTest.view = mockView
    }

    func testRequestRedditData() {
        let postData = Posts.random()
        mockAPIService.postsResult = postData
        objectUnderTest.requestRedditData()
        let children = postData.data.children.map({ $0.data })
        XCTAssertEqual(objectUnderTest.posts, children)
        mockView.reloadDataInvocation = {
            XCTAssert(true)
        }
    }

    func testRequestRedditDataError() {
        let randomError = APIError.random()
        mockAPIService.errorResult = randomError
        objectUnderTest.requestRedditData()
        mockView.showErrorInvocation = { error in
            XCTAssertEqual(randomError, error)
        }

    }

    func testloadImage() {
        let mockImage = UIImage()
        let imageView = UIImageView()
        mockThumbnailLoader.resultImage = mockImage
        objectUnderTest.loadImage(withUrlString: "", toImageView: imageView)
        XCTAssertEqual(imageView.image, mockImage)
    }
}
