//
//  BookCell.swift
//  ReadMeApp
//
//  Created by Raycho Kostadinov on 7.05.22.
//

import Foundation
import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var reviewLabel: UILabel!
    
    @IBOutlet var readMeBookmark: UIImageView!
    @IBOutlet var bookThumbnail: UIImageView!
}
