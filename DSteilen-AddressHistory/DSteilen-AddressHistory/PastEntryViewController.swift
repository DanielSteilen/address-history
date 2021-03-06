//
//  PastEntryViewController.swift
//  DSteilen-AddressHistory
//
//  Created by Daniel Steilen on 3/13/17.
//  Copyright © 2017 DSteilen. All rights reserved.
//

import UIKit

class PastEntryViewController: UIViewController {
    var query = ""
    var result = ""
    
    @IBOutlet weak var direction: UISegmentedControl!
    @IBOutlet weak var addressNum: UITextField!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var streetSuffix: UISegmentedControl!

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
        //need to handle missing or incorrect inputs
        let dir = direction.titleForSegment(at: direction.selectedSegmentIndex)!
        let suffix = streetSuffix.titleForSegment(at: streetSuffix.selectedSegmentIndex)!
        if let numString = Int(addressNum.text!) {
            if streetName.text!.characters.count < 1 {
                triggerAlert("Street name cannot be blank")
            } else {
                let presentAddress = Database.instance.pastToPresent(numString, dir, streetName.text!, suffix)
                query = addressNum.text! + " " + dir + " " + streetName.text! + " " + suffix
                result = presentAddress
                performSegue(withIdentifier: "convert1", sender: sender)
            }
        } else {
            triggerAlert("Address number must be an integer")
        }
    }
    
    func triggerAlert(_ msg: String) {
        let alertController = UIAlertController(title: "Whoops!", message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pastResultViewController =
            segue.destination as? PastResultViewController {
            let oldAddress = self.query
            let newAddress = self.result
            pastResultViewController.newAddress = newAddress
            pastResultViewController.oldAddress = oldAddress
        }
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
