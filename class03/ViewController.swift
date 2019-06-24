//
//  ViewController.swift
//  class03
//
//  Created by L20102-02 on 2019/4/15.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var Label_A: UILabel!
    
    
    @IBAction func Button_Push(_ sender: Any) {
        Label_A.text="HI,Xcode"
    }
    
    @IBAction func btnWebClicked(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "moveToWebSegue", sender: self)
        
    }

    @IBAction func BtnMapClicked(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "moveToMapSegue", sender: self)
        
    }
    
    @IBAction func btnTable(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "moveToTableView", sender: self)
        
    }
    
        
    @IBAction func BtnMoveImageClicked(_ sender: Any) {
        
        let alert=UIAlertController(title: "資訊", message: "YN", preferredStyle: .alert)
        //let alert=UIAlertController(title: "資訊", message: "YN", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title:"YES", style: .default, handler: {action in
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "moveToM2kSeque", sender: self)
            }
            
        })
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title:"Noooooo", style: .default, handler: {action in

        })
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //2019/5/27 初始值forKey
        //print("\(UserDefaults.standard.string(forKey: "hi")!)")
        
        
        //2019/5/27 FileWorker.swift
        let worker : FileWorker=FileWorker()
        //寫檔
        worker.writeToFile(content: "中文", fileName: "info.txt", tag: 0)
        //讀檔
        let results : String = worker.readFromFile(fileName: "info.txt", tag: 0)
        print(results)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "moveToM2kSeque") {
        let vc=segue.destination as! ImageViewControl
            vc.index=5
        }
        
    }


    
}

