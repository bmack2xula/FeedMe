//
//  MenuPageViewController.swift
//  CafePage
//
//  Created by Patrice white on 11/14/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import UIKit

class MenuPageViewController: UIViewController {

    @IBOutlet weak var menuText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "CafeMenu", ofType: "txt"){
            var data = try String(contentsOfFile:path, encoding: .utf8)
                if let content = (data){
                    menuText.text = content
                }
        }
        //let filemanager = FileManager.default
        //if filemanager.fileExists(atPath: path!){
            //do{
                //Store contents of file in array
                //let fullText = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                //let myStrings = fullText.components(separatedBy: .newlines)
                //menuText.text = myStrings.joined(separator: ", ")
                
            //} catch let error as NSError{
            //    print("Error: \(error)")
            //}
        //}

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
