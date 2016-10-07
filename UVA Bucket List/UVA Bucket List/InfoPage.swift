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
    //var passedText:String = "" //won't this destory the text each time?
    var passedStatus:Bool = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.text = passedTitle
        //itemText.text = passedText
        itemStatus.isOn = passedStatus
        let dismissKeyboard = UITapGestureRecognizer.init(target: self, action: #selector(InfoPage.userTappedBackground))
        view.addGestureRecognizer(dismissKeyboard)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userTappedBackground() {
        view.endEditing(true)
    }
    
    /* Goes back to the List View Controller */
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
