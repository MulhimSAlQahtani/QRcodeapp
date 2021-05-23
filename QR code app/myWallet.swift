//
//  Account Info.swift
//  QR code app
//
//  Created by Mulhim Alqahtani on 11/30/19.
//  Copyright © 2019 Mulhim Alqahtani. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class myWallet: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    var dataArray:[myWalletData] = [myWalletData]()
    
    var ref: DatabaseReference!
    
    var myDataWallet: myWalletData!
    var Sname: String!
    var Syear: String!
    var Semail: String!
    var Sjobtittle:String!
    var userArray:[String] = [String]()
    var namearray: [String] = [String]()
    var yeararray: [String] = [String]()
    var jobtittlearray: [String] = [String]()
    var emailarray: [String] = [String]()

    @IBOutlet weak var myWalletTableView: UITableView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.namearray = []
        self.yeararray = []
        self.emailarray = []
        self.jobtittlearray = []
        myWalletTableView.delegate = self
        myWalletTableView.dataSource = self
        
        readFromDatabase()
        
        myWalletTableView.reloadData()
        print("Count IS ")
        print(namearray.count)
        print(namearray)
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("HEY")
        print(namearray)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myWalletCell", for: indexPath) as! customMywalletCell
        cell.name.text = namearray[indexPath.row]
        cell.yearOfBirth.text = yeararray[indexPath.row]
        cell.email.text = emailarray[indexPath.row]
        cell.jobTittle.text = jobtittlearray[indexPath.row]
        return cell
        
    }
    
    
    
//    func configureTableView(){
//
//        myWalletTableView.rowHeight = UITableView.automaticDimension
//        myWalletTableView.estimatedRowHeight = 200
//
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 190
    }



    func readFromDatabase(){
        
ref = Database.database().reference()
        
        
let key = ref.child("users").childByAutoId().key
        
guard let userKey = Auth.auth().currentUser?.uid else {return}
        
        
        
        ref.child("users").observe(.value) { (snapshot) in
            self.userArray = []
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                
                for snap in snapshot {
                    
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        
                        let key = snap.key
                        let data = myWalletData(postKey: key, postData: postDict)
                        
                        print("Snap IS \(key)")
                        
                        self.ref.child("users").child(key).child("Name").observeSingleEvent(of: .value) { (snapshot ) in
                            let name = snapshot.value as? String
                            
                            self.Sname = name
                            print(self.Sname!)
                            self.namearray.append(self.Sname)
                            print(self.namearray)
                          
                            self.myWalletTableView.reloadData()
                            
                        }
                        self.ref.child("users").child(key).child("Year Of Birth").observeSingleEvent(of: .value) { (snapshot ) in
                            let yearOfBirth = snapshot.value as? String
                            
                            self.Syear = yearOfBirth
                            self.yeararray.append(self.Syear)
                             self.myWalletTableView.reloadData()
                            print(self.yeararray)
                         print(self.Syear)
                        }
                        self.ref.child("users").child(key).child("Job Tittle").observeSingleEvent(of: .value) { (snapshot ) in
                            let jobTittle = snapshot.value as? String
                            
                            self.Sjobtittle = jobTittle
                            self.jobtittlearray.append(self.Sjobtittle)
                             self.myWalletTableView.reloadData()
                            print(self.Sjobtittle)
                        }
                        self.ref.child("users").child(key).child("Email").observeSingleEvent(of: .value) { (snapshot ) in
                            let email = snapshot.value as? String
                            
                            self.Semail = email
                            self.emailarray.append(self.Semail)
                             self.myWalletTableView.reloadData()
                            print(self.Semail)
                        }
                      

                    }
                    //print(snap)
                 
                    

                }
                print("ARRRAY TEEEST")
                print(self.namearray)
            }
        }
        print("ARRRRAAYY")
        print(self.namearray)
//
//
        
    }

    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
