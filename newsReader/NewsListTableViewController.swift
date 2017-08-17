//
//  NewsListTableViewController.swift
//  newsReader
//
//  Created by omar kh on 8/15/17.
//  Copyright © 2017 omar kh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator
import SwiftyJSON
import SDWebImage

class NewsListTableViewController: UITableViewController{
    var selectedSource:String!
    var apiToContact : String!
    var arr:JSON = []
    
    @IBOutlet weak var newsImage: UIImageView!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.title = selectedSource
        

        
        
        
        
        
        self.apiToContact = "https://newsapi.org/v1/articles?source="+self.selectedSource+"&apiKey=26a63d0675f04d459b2214eaf8808f3c"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.arr = json["articles"]
                    self.tableView.reloadData() //reload table view (syc..) to show new data
                    print(self.arr)
                    
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableCell", for: indexPath) as! NewsListTableCellViewController
        
        let row = indexPath.row
        
        // 4
        //cell.textLabel?.text = self.arr[row]["title"].rawString()!
        
        cell.articleTitleLabel.text = self.arr[row]["title"].rawString()!
        cell.articleAuthorLabel.text = self.arr[row]["author"].rawString()!
        cell.articleImage.sd_setImage(with: URL(string:self.arr[row]["urlToImage"].rawString()! ))
        cell.articlePublishingDateLabel.text = self.arr[row]["publishedAt"].rawString()!
        
        
        // 5
        return cell
    }
    
    
    
    
    
    


}
