//
//  Account Info.swift
//  QR code app
//
//  Created by Mulhim Alqahtani on 11/30/19.
//  Copyright © 2019 Mulhim Alqahtani. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
class AccountInfo: UIViewController,UITextFieldDelegate{
    
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var yearofbirth: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var jobtittle: UITextField!
    @IBOutlet weak var qrgenerator: UIImageView!
    
    
    var ref: DatabaseReference!
    
    
    
    var Sname: String!
    var Syear: String!
    var Semail: String!
    var Sjobtittle:String!
    
    var line = "\n"
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        yearofbirth.delegate = self
        email.delegate = self
        jobtittle.delegate = self
        
        ReadWriteFromFirebase()
    }
    
    
    //this function is called when qr generator button is pressed
    @IBAction func QrgeneratorBtn(_sender:Any)
    {
        
        
    
       Sname = name.text
       Syear = yearofbirth.text
       Semail = email.text
       Sjobtittle = jobtittle.text
        
        //creating accountinfo string and make it equal to  string inputs that user provided
//        let accountinfo = Sname + line + Syear + line + Semail + line +  Sjobtittle
        
          let accountinfo = "Name: " + Sname + line +  "Year Of Birth: " + Syear + line + "Email: " + Semail + line +  "Job Tittle: " +  Sjobtittle
       
            // the final string of qr generator is named myString
            let myString = accountinfo
        
            // mystring equal to new variable named data
            //method of creating qr generator
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "InputMessage")
        
            //creating the image of qr code generator
            let ciImage = filter?.outputImage
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
        
            //make qrcode generator equal to our image in View
            let image = UIImage(ciImage: transformImage!)
            qrgenerator.image = image
        
        
            ReadWriteFromFirebase()
        
//            ref.child("users").child(userKey).observeSingleEvent(of: .value) { snapshot in
//            var count = "0"
//            if let values = snapshot.value as? [String] {
//                count = String(describing: values.count)
//
//
//            }
//            var fav = [String: String]()
//            fav[count] = key
//            self.ref.child("users").child(userKey).updateChildValues(fav)
        
    //}
            
        
        
        func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
            self.view.endEditing(true)
            return true
        }
        
        
        
        
    }
    
    
    func ReadWriteFromFirebase(){
        
        
        ref = Database.database().reference()
            let key = ref.child("accountInfo").childByAutoId().key
            guard let userKey = Auth.auth().currentUser?.uid else {return}
        
        
        ref.child("accountInfo").child(userKey).child("name").observeSingleEvent(of: .value) { (snapshot ) in
            let name = snapshot.value as? String
           
            self.name.text = name
        }
        ref.child("accountInfo").child(userKey).child("Year Of Birth").observeSingleEvent(of: .value) { (snapshot ) in
            let yearofbirth = snapshot.value as? String
            
            self.yearofbirth.text = yearofbirth
        }
        ref.child("accountInfo").child(userKey).child("Job Tittle").observeSingleEvent(of: .value) { (snapshot ) in
            let jobTittle = snapshot.value as? String
         
            self.jobtittle.text = jobTittle
        }
        ref.child("accountInfo").child(userKey).child("Email").observeSingleEvent(of: .value) { (snapshot ) in
            let email = snapshot.value as? String
           
            self.email.text = email
        }
        
        if(Sname != nil && Syear != nil && Sjobtittle != nil && Semail != nil)
        {
            ref.child("accountInfo").child(userKey).child("name").setValue(Sname)
            ref.child("accountInfo").child(userKey).child("Year Of Birth").setValue(Syear)
            ref.child("accountInfo").child(userKey).child("Job Tittle").setValue(Sjobtittle)
            ref.child("accountInfo").child(userKey).child("Email").setValue(Semail)
        }

        
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func screenshotButton(_sender:Any)
    {
        screenShotMethod()
        
    }
    
    func screenShotMethod(){
        
        
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
