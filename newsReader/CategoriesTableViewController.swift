//
//  CategoriesTableViewController.swift
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
class CategoriesTableViewController : UITableViewController {
    var categoriesArr = ["business","entertainment","gaming","general","music", "politics", "science-and-nature", "sport", "technology"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        }
        
        
        
    
    
    
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoriesArr.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesTableCell", for: indexPath)
        
        let row = indexPath.row
        
        // 4
        cell.textLabel?.text = self.categoriesArr[row]
        
        // 5
        return cell
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let identifier = segue.identifier{
//            if identifier == "viewNewsSeg"{
//                let indexPath = tableView.indexPathForSelectedRow!
//                let selectedSource = self.arr[indexPath.row]["id"].rawString()!
//                let newsListController = segue.destination as! NewsListTableViewController
//                newsListController.selectedSource = selectedSource
//                
//            }
//            
//        }
//    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let identifier = segue.identifier{
                if identifier == "showChanels"{
                    let indexPath = tableView.indexPathForSelectedRow!
                    let selectedCategory = self.categoriesArr[indexPath.row]
                    let sourcesTableView = segue.destination as! sourcesListTableViewController
                    sourcesTableView.selectedCategory = selectedCategory
    
                }
    
            }
        }




}
