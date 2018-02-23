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
    
    //MARK: - VIEW CONTROLLER LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    //MARK: - FORM INITIAL BUTTON...
    @IBAction func formInitialAction(_ sender: Any) {
        getCustomImage(imageDisplayName: initialsTextField.text, imageView: initialsImageView)
    }
    

    //MARK: - Get Custom Image
    func getCustomImage(imageDisplayName: String?, imageView: UIImageView!){
        if let name = imageDisplayName, !name.isEmpty {
            imageView.setImage(string:name, color: UIColor.colorHash(name: name), circular: true, stroke: true)
        }else{
            imageView.setImage(string:"Display Picture", color: UIColor.colorHash(name: "Display Picture"), circular: false)
        }
    }
    
}
