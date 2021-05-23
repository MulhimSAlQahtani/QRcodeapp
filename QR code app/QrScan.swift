//
//  Account Info.swift
//  QR code app
//
//  Created by Mulhim Alqahtani on 11/30/19.
//  Copyright © 2019 Mulhim Alqahtani. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Firebase
class QrScan: UIViewController, AVCaptureMetadataOutputObjectsDelegate{
    
    var video = AVCaptureVideoPreviewLayer()
    
     var line = "\n"
    
    var Sname: String!
    var Syear: String!
    var Semail: String!
    var Sjobtittle:String!
    var userArray:[String] = [String]()
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var Square: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Creating session
        
        let session = AVCaptureSession()
        
        
        //define capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
            
        }
        catch
        {
            print("error")
            
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubviewToFront(Square)
        session.startRunning()
        
        
    }
    var num  = 1
    

    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil && metadataObjects.count != 0{
            
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {       //AVMetadataObjectTypeQRCode
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                    let firstObjectString = object.stringValue?.components(separatedBy: "\n")
                    for word in firstObjectString! {
                        
                        var text = word
                        var textindex = text.startIndex
                        
                        userArray.append(text)
                        
                        
                    }
                    Sname = userArray[0]
                    Syear = userArray[1]
                    Semail = userArray[2]
                    Sjobtittle = userArray[3]
                    
                     let accountinfo = "Name: " + Sname + line +  "Year Of Birth: " + Syear + line + "Email: " + Semail + line +  "Job Tittle: " +  Sjobtittle
                    
                    let alert = UIAlertController(title: "QR Code", message: accountinfo, preferredStyle: .alert)
                    print(object.stringValue)
                  
                    
                   
                   
                    
                    
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (nil) in
                       
                        UIPasteboard.general.string = object.stringValue
                        self.pushData()
                    }))
                    
                    present(alert,animated: true, completion: nil)
                }
            }
        }
    }
    
    
    func pushData(){
        print(Sname!)
        ref = Database.database().reference()
        let key = ref.child("users").childByAutoId().key
        ref.child("users").child(key!).child("Name").setValue(Sname!)
        ref.child("users").child(key!).child("Year Of Birth").setValue(Syear!)
        ref.child("users").child(key!).child("Job Tittle").setValue(Sjobtittle!)
        ref.child("users").child(key!).child("Email").setValue(Semail!)
        

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
