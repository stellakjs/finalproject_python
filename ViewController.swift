//
//  ViewController.swift
//  Budget.it
//
//  Created by Stella wang on 12/6/20.
//

import UIKit

class ViewController: UIViewController {
    var tasks = [String]()
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Months"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().setValue(0, forKey: "count")
        }
        updateMonths()
    }
    
    func updateMonths(){
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        for x in 0..<count{
            
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
               
                tasks.append(task)
                
            }
        }
        
        tableView.reloadData()
        
        
        
    }
    
    

    @IBAction func didTapAdd(){
        
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewcontroller
        vc.title = "New Month"
        vc.update = {
            DispatchQueue.main.async{
            self.updateMonths()
            }
        }
        navigationController?.pushViewController( vc, animated: true)
        
        
    }

}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "info") as! InfoViewController
        vc.title = "Spendings this Month"
        
        navigationController?.pushViewController( vc, animated: true)
    }
}


extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = tasks[indexPath.row]
        
            return cell
    }
    
    
}
