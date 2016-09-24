//
//  ViewController.swift
//  UVA Bucket List
//
//  Created by Nader Maharmeh on 9/24/16.
//  Copyright © 2016 Nader Maharmeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var items: [String] = ["Streak the Lawn", "Carter's Mountain", "Slap Sullivan"]
    
    @IBOutlet weak var listTableView: UITableView!
    @IBAction func addItem(_ sender: AnyObject) {
        alert()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem") as! itemTableViewCell
        cell.itemLabel.text = items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return items.count
    }
    
    func alert() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        alert.addTextField{
            (textfield) in
            textfield.placeholder = "What do you want to cross off your Bucket List"
        }
        let add = UIAlertAction(title: "Add", style: .default){
            (action) in
            let textfield = alert.textFields![0] as! UITextField
            self.items.append(textfield.text!)
            self.listTableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){
            (alert) in
            
            print("Hi")
            
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

