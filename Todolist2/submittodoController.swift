//
//  submittodoController.swift
//  Todolist2
//
//  Created by IMCS2 on 7/27/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
class submittodoController: UIViewController {
    @IBOutlet weak var textTodo : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonSubmit(_ sender: Any){
        todoListItems.append(textTodo.text!)
        UserDefaults.standard.set(todoListItems, forKey: "item")
        
    }
   
    
}
