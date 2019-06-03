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
    
    @IBAction func BtnMoveImageClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "moveToM2kSeque", sender: self)
        
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

