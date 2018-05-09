//
//  SongTableViewCell.swift
//  MusicApp_iOS
//
//  Created by Anuranjan Bose on 10/05/18.
//  Copyright © 2018 Anuranjan Bose. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
