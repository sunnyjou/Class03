//
//  MyBrowserViewController.swift
//  class03
//
//  Created by L20102-02 on 2019/5/6.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit
import WebKit

class MyBrowserViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var btnGoBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
    
    //MARK: - TextFiled
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 比對字串
        let accept = "abcdeABCDE"
        let cs = NSCharacterSet(charactersIn: accept).inverted
        let filters = string.components(separatedBy: cs).joined(separator: "")
        if (string != filters)
        {
            return false
        }
        
        
        //限制字數
        let current = textField.text! as NSString
        let newString :NSString = current.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= 10
    }
    
  
    
    
    //MARK: - Keyboard
    @objc func keyboardWillAppear(notification: NSNotification?) {
        print("keyboardWillAppear")
        
        
        guard let frame=notification? .userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        UIView.animate(withDuration: 50, animations: {
            self.btnGoBottomConstraint.constant = frame.cgRectValue.height;
        })       
        
        
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification?) {
        print("keyboardWillDisappear")
        
        UIView.animate(withDuration: 15000, animations: {
            self.btnGoBottomConstraint.constant = 31;
        })
        
        
    }
    


}
