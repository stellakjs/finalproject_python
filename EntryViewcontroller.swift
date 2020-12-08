//
//  EntryViewcontroller.swift
//  Budget.it
//
//  Created by Stella wang on 12/6/20.
//

import UIKit

class EntryViewcontroller: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self 
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveInfo))
       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        saveInfo()

        return true
    }

    @objc func saveInfo(){
        guard let text = field.text, !text.isEmpty else{
            return
        }

        guard let  count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        let newCount = count + 1

        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")

        update?()

        navigationController?.popViewController(animated: true)

    }
}
