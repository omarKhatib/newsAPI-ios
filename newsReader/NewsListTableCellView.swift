//
//  NewsListTableCellViewController.swift
//  newsReader
//
//  Created by omar kh on 8/17/17.
//  Copyright © 2017 omar kh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator
import SwiftyJSON

class NewsListTableCellView: UITableViewCell{
    
    @IBOutlet weak var articleDescriptionTextView:UIScrollView!

    @IBOutlet weak var articleAuthorLabel: UILabel!

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articlePublishingDateLabel: UILabel!
    @IBOutlet weak var articleTitleButton: UIButton!
}
