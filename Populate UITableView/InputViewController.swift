//
//  InputViewController.swift
//  Populate UITableView
//
//  Created by Alisher Abdukarimov on 5/8/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit


class InputViewController: UIViewController {
    
    @IBOutlet weak var textFieldOultet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        if textFieldOultet.text != "" {
        dataSource.title.append(textFieldOultet.text!)
        print(dataSource.title.count)
        textFieldOultet.text = ""
        }else{
        print("Type Something bro")
        }
        
        
    }
    
}
