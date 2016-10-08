//
//  InfoPage.swift
//  UVA Bucket List
//
//  Created by Austin Chang on 10/6/16.
//

import UIKit

class InfoPage: UIViewController {

    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var itemText: UITextView!
    @IBOutlet weak var itemStatus: UISwitch!
    var passedTitle:String = ""
    var passedText:String = ""
    var passedStatus:Bool = false
    
    //Loaded at beginnng of view controller's life
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.text = passedTitle
        itemStatus.isOn = passedStatus
        itemText.text = passedText
        let dismissKeyboard = UITapGestureRecognizer.init(target: self, action: #selector(InfoPage.userTappedBackground))
        view.addGestureRecognizer(dismissKeyboard)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //dismiss the keyboard
    @IBAction func userTappedBackground() {
        view.endEditing(true)
    }
    
    //updates the values of the cells in the ViewController (facilitates saving between view controllers)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        let targetPath = destination.currentPath
        
        let targetCell = destination.listTableView.cellForRow(at: targetPath!) as! itemTableViewCell //potential crash
        targetCell.myText = itemText.text
        targetCell.textLabel?.text = itemTitle.text
        
        if (itemStatus.isOn) {
            targetCell.backgroundColor = UIColor.green
        }
        else {
            targetCell.backgroundColor = UIColor.white
        }
    }
}
