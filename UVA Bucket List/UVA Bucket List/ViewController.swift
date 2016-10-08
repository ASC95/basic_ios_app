//  ViewController.swift
//  UVA Bucket List
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var items: [String] = ["Streak the Lawn", "Go to Carter's Mountain", "Party with T-Sully", "Frat Every Day"]
    var currentPath:IndexPath? = nil
    
    @IBOutlet weak var listTableView: UITableView!
    @IBAction func addItem(_ sender: AnyObject) {
        alert()
    }
    
    /* Usually called once when the view controller is loaded into memory. Establishes things that will last the entire lifecycle. In this case, it sets the TableView data source and swipe recognition constants */
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
    }

    //Automatically called because I created the segue in the storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = listTableView.cellForRow(at: listTableView.indexPathForSelectedRow!) as! itemTableViewCell
        
        self.currentPath = listTableView.indexPathForSelectedRow
        
        if (segue.identifier == "specialSeg") {
            let destination = segue.destination as! InfoPage
            
            destination.passedTitle = (cell.textLabel?.text)!
            destination.passedText = cell.myText
            
            if (cell.backgroundColor == UIColor.green) {
                destination.passedStatus = true
            }
            if (cell.backgroundColor == UIColor.white) {
                destination.passedStatus = false
            }
        }
    }
    
    //Takes a UISwipeGestureRecognizer from viewDidLoad. Allows a table cell to change color depending on which way it was swiped
    func cellSwiped(mySender:UISwipeGestureRecognizer) {
        let point = mySender.location(in: self.listTableView)
        let path = self.listTableView.indexPathForRow(at: point)
        if (path != nil) {
            let cell = self.listTableView.cellForRow(at: path!)
            if (mySender.direction == .left) {
                cell?.backgroundColor = UIColor.white
            }
            if (mySender.direction == .right) {
                cell?.backgroundColor = UIColor.green
            }
        }
    }
    
    /* Required. Asks the data source for a cell to insert in a particular location of the table view. */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listItem") as! itemTableViewCell
        cell.textLabel?.text = items[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    /* Required. Tells the data source to return the number of rows in a given section of a table view. */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count //should return "4" at the start
    }
    
    /* Creates alert notifications that are displayed to the user for certain actions*/
    func alert() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addTextField{
            (textfield) in textfield.placeholder = "What do you want to add to your Bucket List?"
        }
        let add = UIAlertAction(title: "Add", style: .default){
            (action) in
            let textfield = alert.textFields![0]
            self.items.append(textfield.text!)//add the string to the array
            self.listTableView.reloadData()//update the table
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){
            (alert) in
            //print("Hi")
        }
        alert.addAction(add)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Invoked just before the unwind segue occurs. THIS IS THE UNWIND SEGUE DESTINATION BECAUSE IT IMPLEMENTS THIS METHOD
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        
    }
}

