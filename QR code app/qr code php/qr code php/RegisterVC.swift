//
//  ViewController.swift
//  qr code php
//
//  Created by Aok Kurdi on 2/10/19.
//  Copyright © 2019 Aok Kurdi. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    @IBOutlet weak var emailtext: UITextField!
    
    @IBOutlet weak var fnametxt: UITextField!
    
    @IBOutlet weak var lastnametxt: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Register_Click(_ sender: Any) {
        
        
        if username.text!.isEmpty || passwordtxt.text!.isEmpty || emailtext.text!.isEmpty || fnametxt.text!.isEmpty || lastnametxt.text!.isEmpty {
            
            //red placeholders
            username.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            passwordtxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            emailtext.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            fnametxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            lastnametxt.attributedPlaceholder = NSAttributedString(string: "surname", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            // if text is entered
        }
        else {
            
            
            
        }
        
    }
    
}

