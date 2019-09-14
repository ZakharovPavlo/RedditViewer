//
//  LastLinkStorageProtocol.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 14.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation

protocol LastLinkStorageProtocol {
    var lastLink: String? { get set }

    func storeLastLink()

    func getLink() -> String?
}
