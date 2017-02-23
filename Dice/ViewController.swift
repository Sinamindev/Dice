//
//  ViewController.swift
//  Dice
//
//  Created by Sina on 2/22/17.
//  Copyright © 2017 Sina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var diceBoxNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Actions

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        diceBoxNameLabel.text = "Default text"
    }
}

