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
    var refreshControlNews: UIRefreshControl?

    
    
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
        
        
        
        refreshControlNews = UIRefreshControl()
        refreshControlNews?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControlNews?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControlNews!)
        
        
        
    }
    
    
    func refresh(sender:AnyObject) {
        tableView.reloadData()
        refreshControlNews?.endRefreshing()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableCell", for: indexPath) as! NewsListTableCellView
        
        let row = indexPath.row
        
        // 4
        //cell.textLabel?.text = self.arr[row]["title"].rawString()!
        
        cell.articleTitleButton.setTitle(self.arr[row]["title"].rawString()!, for: .normal)
        cell.articleAuthorLabel.text = self.arr[row]["author"].rawString()!
        cell.articleImage.sd_setImage(with: URL(string:self.arr[row]["urlToImage"].rawString()! ))
        cell.articlePublishingDateLabel.text = self.arr[row]["publishedAt"].rawString()!
        cell.articleTitleButton.accessibilityHint = self.arr[row]["description"].rawString()!
//        cell.articleTitleButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        
        // 5
        return cell
    }
    
//    @objc private func buttonClicked(sender:UIButton) {
//        
//        print(sender.accessibilityHint!)
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "viewSingleArticle"{
                let indexPath = tableView.indexPathForSelectedRow!
                let selectedTitle = self.arr[indexPath.row]["title"].rawString()!
                let selectedImage = self.arr[indexPath.row]["urlToImage"].rawString()!
                let selectedDescription = self.arr[indexPath.row]["description"].rawString()!
                let selectedAuthor = self.arr[indexPath.row]["author"].rawString()!
                let selectedDate = self.arr[indexPath.row]["publishedAt"].rawString()!
                let selectedUrl = self.arr[indexPath.row]["url"].rawString()!
                
              let singleArticleController = segue.destination as! SingleArticleViewController
                
                singleArticleController.selectedTitle = selectedTitle
                singleArticleController.selectedImage = selectedImage
                singleArticleController.selectedDescription = selectedDescription
                singleArticleController.selectedAuthor = selectedAuthor
                singleArticleController.selectedDate = selectedDate
                singleArticleController.selectedUrl = selectedUrl
                
            
                
            
            }
        
        }
    }
    
    
    
    


}
