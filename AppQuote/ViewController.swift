//
//  ViewController.swift
//  AppQuote
//
//  Created by Patrice white on 10/16/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var funFactLabel: UILabel!
    
    let funFacts = Facts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show fact when app loads
        funFactLabel.text = funFacts.randomFact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

