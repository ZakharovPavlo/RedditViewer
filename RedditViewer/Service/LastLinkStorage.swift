//
//  LastLinkStorage.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation

class LastLinkStorage  {
    var lastLink: String?

    func storeLastLink() {
        UserDefaults.standard.set(lastLink, forKey: "lastVisitedLink")
    }

    func getLink() -> String? {
        return UserDefaults.standard.value(forKey: "lastVisitedLink") as? String
    }
}
