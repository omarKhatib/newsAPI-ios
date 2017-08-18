//
//  sourcesListTableViewContoller.swift
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
class sourcesListTableViewController : UITableViewController {
    
    var selectedCategory:String!
    
    
    
    
    var arr:JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://newsapi.org/v1/sources?language=en&category="+selectedCategory+"&apiKey=26a63d0675f04d459b2214eaf8808f3c").validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.arr = json["sources"]
                    self.tableView.reloadData() //reload table view (syc..) to show new data
                    
                    
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
        
    }
    
    
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "sourcesTableCell", for: indexPath)
        
        let row = indexPath.row
        
        // 4
        cell.textLabel?.text = self.arr[row]["name"].rawString()!
        
        // 5
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "viewNewsSeg"{
                let indexPath = tableView.indexPathForSelectedRow!
                let selectedSource = self.arr[indexPath.row]["id"].rawString()!
                let newsListController = segue.destination as! NewsListTableViewController
                newsListController.selectedSource = selectedSource
                
            }
        
        }
    }
    
    
    

    
    





}
