//
//  ViewController.swift
//  UVA Bucket List
//
//  Created by Nader Maharmeh on 9/24/16.
//  Copyright © 2016 Nader Maharmeh. All rights reserved.
//

//This clss is a custom subclass of UIViewController
//UISwipeGestureRecognizer is an Objective-C function
//swiping activates a color change

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var items: [String] = ["Streak the Lawn", "Carter's Mountain", "Slap Sullivan"]
    @IBOutlet weak var listTableView: UITableView!
    
    @IBAction func addItem(_ sender: AnyObject) {
        alert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        listTableView.dataSource = self
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.cellSwiped))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.cellSwiped))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        //let infoPage = UITapGestureRecognizer(target: self, action: #selector(ViewController.cellTapped))
    }
    
    func cellSwiped(mySender:UISwipeGestureRecognizer) {
        let point = mySender.location(in: self.listTableView) //this is a CGPoint
        let path = self.listTableView.indexPathForRow(at: point) //this is an IndexPath
        let cell = self.listTableView.cellForRow(at: path!) //this is a UITableViewCell
        if (mySender.direction == .left) {
            cell?.backgroundColor = UIColor.white
        }
        if (mySender.direction == .right) {
            cell?.backgroundColor = UIColor.green
        }
    }
    /*
    func cellTapped(mySender:UITapGestureRecognizer) {
        UIViewController
    }
     */
    
    /*
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            //self.listTableView.cellForRow(at: 1.1)
            /*let labelPosition = CGPoint(x: self.listTableView.frame.origin.x - 50.0, y: self.listTableView.frame.origin.y);
            listTableView.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: self.listTableView.frame.size.width, height: self.listTableView.frame.size.height)*/
        }
        
        if (sender.direction == .right) {
            /*let labelPosition = CGPoint(x: self.listTableView.frame.origin.x + 50.0, y: self.listTableView.frame.origin.y);
            listTableView.frame = CGRect(x: labelPosition.x, y: labelPosition.y , width: self.listTableView.frame.size.width, height: self.listTableView.frame.size.height)*/
        }
    }
     */

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
            (textfield) in textfield.placeholder = "What do you want to cross off your Bucket List"
        }
        let add = UIAlertAction(title: "Add", style: .default){
            (action) in
            let textfield = alert.textFields![0] as! UITextField
            self.items.append(textfield.text!)//add the string to the array
            self.listTableView.reloadData()//update the table
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

