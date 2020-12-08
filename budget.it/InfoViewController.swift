//
//  InfoViewController.swift
//  Budget.it
//
//  Created by Stella wang on 12/6/20.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var amountstart: UITextField!
    @IBOutlet weak var amountspent: UITextField!
    @IBOutlet weak var amountearned: UITextField!
    @IBOutlet weak var texview: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountstart.delegate = self
        amountspent.delegate = self
        amountearned.delegate = self
        
                
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func updateinfo(_ sender: Any){
        
        let fristValue = Double(amountstart.text!)
        let secondvalue = Double(amountearned.text!)
        let thirdvaluse = Double(amountspent.text!)
        let outputvalue = Double((fristValue! + secondvalue!)-thirdvaluse!)
        
        texview.text = "$ \(outputvalue)"
       
        UserDefaults.standard.set(texview.text, forKey: "amount")
        }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "amount") as? String{
            texview.text = x
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        amountspent.resignFirstResponder()
        amountearned.resignFirstResponder()
        amountstart.resignFirstResponder()
        
    }
    
    
    
}

extension InfoViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    
        
        return true
        
    }
    
   
    
    
    
    
}
