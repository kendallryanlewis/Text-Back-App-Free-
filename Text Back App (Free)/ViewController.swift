//
//  ViewController.swift
//  Text Back App (Free)
//
//  Created by Hackintosh on 2/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterNewMessage: UITextField! //Enter message text field
    @IBOutlet weak var company: UILabel! //comapny label
    @IBOutlet weak var overlay: UIView! //overlay for active/inactive
    @IBOutlet weak var viewNewMessage: UITextView! //Message display area
    @IBOutlet weak var ubeView: UIView! //holds main view for user
    @IBOutlet weak var leadingC: NSLayoutConstraint!//constraint for left side of view
    @IBOutlet weak var trailingC: NSLayoutConstraint! //constraint for right side of view
    
    @IBOutlet weak var mainBackgroundView: UIView!
    var hamburgerMenusIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterNewMessage.layer.shadowOffset = CGSize(width:0, height:4)
        enterNewMessage.layer.shadowRadius = 4
        enterNewMessage.layer.shadowOpacity = 0.4
        self.overlay.isHidden = true //Hide overlay on setup
        
        enterNewMessage.layer.shadowRadius = 4
        enterNewMessage.layer.shadowOpacity = 0.4
        self.overlay.isHidden = true //Hide overlay on setup
    }
    
    /******************************** Startup functions *****************************************/

    func insertNewMessage(){
        let updatedMessage = enterNewMessage.text
        self.enterNewMessage.textColor = UIColor.lightGray //change company text color to gray
        enterNewMessage.text = ""//displays new message
        viewNewMessage.text = updatedMessage //displays new message
        
        //enterNewMessage.attributedPlaceholder = NSAttributedString(string:updatedMessage!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray]) //Changes the placeholder text
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     }*/
    
    
    /******************************** Buttons/Switch functions *****************************************/
    @IBAction func activeSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.company.textColor = UIColor.black //change company text color to black
            self.overlay.isHidden = true //hide overlay when switch toggled
        }else{
            self.overlay.isHidden = false //shows overlay
            self.overlay.backgroundColor = UIColor.black.withAlphaComponent(0.8) //change background overlay color to black
            self.company.textColor = UIColor.white //change company text color to white
        }
    }
    @IBAction func newMessageButton(_ sender: Any) {
        insertNewMessage() //Run insertNewMessage function
    }
    
    @IBAction func hamburgerBtnTapped(_ sender: Any) {//hamburger menu button
        if !hamburgerMenusIsVisible{ //If menu is not visible, display menu
            leadingC.constant = 350
            trailingC.constant = -350
            hamburgerMenusIsVisible = true
        }else{//if menu is visible move the menu back
            leadingC.constant = 0
            trailingC.constant = 0
            hamburgerMenusIsVisible = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {//animation for menu
            self.view.layoutIfNeeded()
        }){(animationComplete) in
            print("The animation is complete!")// verify manu is called and displayed
        }
    }
}
