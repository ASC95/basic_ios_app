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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
