//
//  Account Info.swift
//  QR code app
//
//  Created by Mulhim Alqahtani on 11/30/19.
//  Copyright © 2019 Mulhim Alqahtani. All rights reserved.
//
import UIKit
import Foundation
import Firebase
import SwiftKeychainWrapper
class LoginVC: UIViewController,UITextFieldDelegate {
    
    let KEY_UID = "uid"
    
    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var email: UITextField!
    
     var emailS = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        passwordtxt.delegate = self
        email.delegate = self
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            performSegue(withIdentifier: "goToMainVC", sender: nil)
            
            
        }
        
        print("hi")
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        
        
        if let email = email.text, let pwd = passwordtxt.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print(" Email user authenticated with Firebase")
                    if let user = user {
                        self.completeSignIn(user.user.uid)
                        
                    }
                }
                else {
                    Auth.auth().createUser(withEmail: email, password: pwd,completion: { (user, error) in
                        
                        if error != nil {
                            print("Unable to Authenticate with firebase email")
                        }  else {
                            print("Successfully Authenticated with firebase ")
                            if  let user = user {
                                
                               // self.completeSignIn(self.usernametxt.text!)
                                  self.completeSignIn(self.email.text!)
                            }
                            
                        }
                        
                        //
                        //            let user = FIRAuth.auth()?.currentUser
                        //            let email = user?.email
                        //            print(email!)
                        
                    })
                }
            })
            emailS = email
        }
        
        
    }
    
    
    func completeSignIn(_ id: String){
        KeychainWrapper.standard.set(id, forKey: KEY_UID )
        performSegue(withIdentifier: "goToMainVC", sender: nil)
    }
    
   
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
