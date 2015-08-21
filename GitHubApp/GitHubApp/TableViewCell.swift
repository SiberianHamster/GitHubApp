//
//  TableViewCell.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/19/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  @IBOutlet weak var repoName: UILabel!

  @IBOutlet weak var repoURL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
