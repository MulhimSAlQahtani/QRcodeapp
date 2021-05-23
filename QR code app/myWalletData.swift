//
//  Account Info.swift
//  QR code app
//
//  Created by Mulhim Alqahtani on 11/30/19.
//  Copyright © 2019 Mulhim Alqahtani. All rights reserved.
//

import Foundation
import Firebase
class myWalletData{
    
    var name = ""
    var yearOfBirth = ""
    var jobTittle = ""
    var email = ""
    var key = ""
     var ref: DatabaseReference!
    
    
    func userData(name: String, yearOfBirth: String, JobTittle: String, email:String){
        
        self.name = name
        self.yearOfBirth = yearOfBirth
        self.jobTittle = JobTittle
        self.email = email
    }
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self.key = postKey
        
        print(postKey, "POST KEY")
        
        //        if let caption = postData["Caption"] as? String {
        //            self._caption = caption
        //        }
        
        if let name = postData["name"] as? String {
            self.name = name
        }
        
        ref = Database.database().reference().child(postKey)
       // ref = DataService.ds.REF_Movies.child(_postkey)
        
    }
}
