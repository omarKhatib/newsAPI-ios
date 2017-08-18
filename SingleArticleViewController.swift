//
//  SingleArticleViewController.swift
//  newsReader
//
//  Created by omar kh on 8/18/17.
//  Copyright © 2017 omar kh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator
import SwiftyJSON
import SDWebImage
class SingleArticleViewController : UIViewController{
    var selectedTitle:String!
    var selectedImage:String!
    var selectedDescription:String!
    var selectedDate:String!
    var selectedAuthor:String!
    var selectedUrl:String!
    @IBOutlet weak var selectedArticleTitleLabel: UILabel!
    
    @IBOutlet weak var selectedArticleImage: UIImageView!
    
    @IBOutlet weak var selectedArticleDescription: UITextView!
    
    @IBOutlet weak var selectedAuthorLabel: UILabel!
    
    @IBOutlet weak var selectedDateLabel: UILabel!
    
    @IBOutlet weak var readMorebutton: UIButton!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
  selectedArticleTitleLabel.text = selectedTitle
  selectedArticleImage.sd_setImage(with: URL(string: selectedImage! ))
        selectedArticleDescription.text = selectedDescription
        
        selectedDateLabel.text = selectedDate
        selectedAuthorLabel.text = selectedAuthor
        
        
        
    }

    @IBAction func readMorebutton(_ sender: Any) {
        print("clicking!")
        let URL = NSURL(string: selectedUrl)! as URL
        UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        
 
    }




}
