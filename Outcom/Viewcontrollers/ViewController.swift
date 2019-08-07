//
//  ViewController.swift
//  Outcom
//
//  Created by Eduardo Landa  on 2019-07-15.
//  Copyright © 2019 Eduardo Landa . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = 10;
        facebookButton.layer.cornerRadius = 10;
        googleButton.layer.cornerRadius = 10;
        // Do any additional setup after loading the view, typically from a nib.
    }


}

