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

class NewsListTableCellViewController: UITableViewCell{

    @IBOutlet weak var articleTitleLabel: UILabel!

    @IBOutlet weak var articleAuthorLabel: UILabel!

    @IBOutlet weak var articleImage: UIImageView!
}