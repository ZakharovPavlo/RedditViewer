//
//  PostCell.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import Foundation
import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var authorLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var thumbnailImageView: UIImageView!

    @IBOutlet weak var commentsLabel: UILabel!

    @IBOutlet weak var thumbnailWidthConstraint: NSLayoutConstraint!

    @IBOutlet weak var thumbnailHeightConstraint: NSLayoutConstraint!
    
    func setUpWith(post: ChildData) {
        thumbnailWidthConstraint.constant = CGFloat(post.thumbnailWidth ?? 150)
        thumbnailHeightConstraint.constant = CGFloat(post.thumbnailHeight ?? 150)
        authorLabel.text = "😎\(post.author)"
        titleLabel.text = post.title
        commentsLabel.text = "💬\(post.numComments)"
        dateLabel.text = "⏱\(post.hoursFromNow) hours ago"
        layoutIfNeeded()
    }
}
