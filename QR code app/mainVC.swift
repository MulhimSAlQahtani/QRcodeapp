//
//  Account Info.swift
//  QR code app
//
//  Created by Mulhim Alqahtani on 11/30/19.
//  Copyright © 2019 Mulhim Alqahtani. All rights reserved.
//

import UIKit
import Firebase
class mainVC: UIViewController {

    @IBOutlet weak var qrscanbutton: UIButton!
    @IBOutlet weak var accountinfobutton: UIButton!
    @IBOutlet weak var settingsbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func qrscanpressed(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.qrscanbutton.backgroundColor = UIColor.blue
            self.qrscanbutton.showsTouchWhenHighlighted = true
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.qrscanbutton.backgroundColor = UIColor.clear
            self.qrscanbutton.showsTouchWhenHighlighted = true
        }, completion: nil)
        
    }
    
    @IBAction func accountinfopressed(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.accountinfobutton.backgroundColor = UIColor.blue
            self.accountinfobutton.showsTouchWhenHighlighted = true
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.accountinfobutton.backgroundColor = UIColor.clear
            self.accountinfobutton.showsTouchWhenHighlighted = true
        }, completion: nil)
    }
    
    
    @IBAction func settingspressed(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.settingsbutton.backgroundColor = UIColor.blue
            self.settingsbutton.showsTouchWhenHighlighted = true
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.settingsbutton.backgroundColor = UIColor.clear
            self.settingsbutton.showsTouchWhenHighlighted = true
        }, completion: nil)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

