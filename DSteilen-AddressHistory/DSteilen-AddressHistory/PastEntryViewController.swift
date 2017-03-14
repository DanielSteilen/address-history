//
//  PastEntryViewController.swift
//  DSteilen-AddressHistory
//
//  Created by Daniel Steilen on 3/13/17.
//  Copyright © 2017 DSteilen. All rights reserved.
//

import UIKit

class PastEntryViewController: UIViewController {
    @IBOutlet weak var direction: UISegmentedControl!
    @IBOutlet weak var addressNum: UITextField!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var result: UILabel!

    @IBOutlet var textFields: [UITextField]!
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func convertAddress(_ sender: UIButton) {
        //need to handle case of number being other than int
        var presentAddress: String = "Error"
        if let numString = Int(addressNum.text!) {
            presentAddress = Database.instance.pastToPresent(numString, direction.titleForSegment(at: direction.selectedSegmentIndex)!, streetName.text!)
        } else {
            print("Address entered not an int")
        }
        result.text = presentAddress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
