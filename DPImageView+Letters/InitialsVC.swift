//
//  InitialsVC.swift
//  DPImageView+Letters
//
//  Created by Deepakraj Murugesan on 23/02/18.
//  Copyright © 2018 Deepak. All rights reserved.
//

import UIKit

class InitialsVC: UIViewController {

    @IBOutlet weak var initialsImageView: UIImageView!
    @IBOutlet weak var initialsTextField: UITextField!
    @IBOutlet weak var formInitialsButtonOutlet: UIButton!
    var isCircularWithStroke: Bool = false
    
    @IBOutlet weak var circularSwitch: UISwitch!
    //MARK: - VIEW CONTROLLER LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        formInitialsButtonOutlet.layer.cornerRadius = 5
        formInitialsButtonOutlet.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    //MARK: - FORM INITIAL BUTTON...
    @IBAction func formInitialAction(_ sender: Any) {
        getCustomImage(imageDisplayName: initialsTextField.text, imageView: initialsImageView)
    }
    
    //MARK: - BackGround Tap
    @IBAction func backGroupTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    //MARK: - Get Custom Image
    func getCustomImage(imageDisplayName: String?, imageView: UIImageView!){
        if let name = imageDisplayName, !name.isEmpty {
            imageView.setImage(string:name, color: UIColor.colorHash(name: name), circular: isCircularWithStroke, stroke: isCircularWithStroke)
        }else{
            imageView.setImage(string:"Display Picture", color: UIColor.colorHash(name: "Display Picture"), circular: isCircularWithStroke, stroke: isCircularWithStroke)
        }
    }
    
    //MARK: - Switch OnClick
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn{
            isCircularWithStroke = true
        }else{
            isCircularWithStroke = false
        }
    }
    
}
extension InitialsVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    fileprivate func resetEntireSubview() {
        initialsImageView.image = nil
        circularSwitch.isOn = false
        isCircularWithStroke = false
        formInitialsButtonOutlet.backgroundColor = UIColor(red:0.46, green:0.51, blue:0.55, alpha:0.3)
        formInitialsButtonOutlet.isUserInteractionEnabled = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.characters.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.characters.count - range.length
        
        //change the value of the label
        if newLength > 0{
            formInitialsButtonOutlet.backgroundColor = UIColor(red:0.18, green:0.49, blue:0.82, alpha:1.0)
            formInitialsButtonOutlet.isUserInteractionEnabled = true
        }else{
            resetEntireSubview()
        }
        return newLength <= 25 // To just allow up to 25 characters
    }
    
    
}
