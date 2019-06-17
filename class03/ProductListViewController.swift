//
//  ProductListViewController.swift
//  class03
//
//  Created by L20102 on 2019/6/17.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        //let cell : UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "a")
        //cell.textLabel?.text = self.array[indexPath.row]
        
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) as! MyTableViewCell
        let title : String = self.array[indexPath.row]
        cell.updateContent(content: title)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedContent = self.array[indexPath.row]
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToDetailSegue", sender: self)
        }
        
    }
    
    
    var selectedContent : String?
    
    var array : [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        array = ["Swift is very strict about types. But although explicit typing is good for saving us from mistakes, it becomes painful when dealing with JSON and other areas that are, by nature, implicit about types.", "iOS 8.0+ | macOS 10.10+ | tvOS 9.0+ | watchOS 2.0+ Xcode 8", "c"]
        
    }
    

    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "moveToDetailSegue") {
            
            let destination = segue.destination as! DetailViewController
            
            destination.content = self.selectedContent
            
        }
        
        
    }
}
