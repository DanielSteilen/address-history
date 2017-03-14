//
//  PresentResultViewController.swift
//  DSteilen-AddressHistory
//
//  Created by Daniel Steilen on 3/14/17.
//  Copyright © 2017 DSteilen. All rights reserved.
//

import UIKit

class PresentResultViewController: UIViewController {
    var oldAddress = ""
    var newAddress = ""
    
    @IBOutlet weak var newAddressLabel: UILabel!
    @IBOutlet weak var oldAddressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (oldAddress != "Address not found") {
            oldAddressLabel.text = oldAddress + " before 1911"
            newAddressLabel.text = newAddress + " was:"
        } else {
            newAddressLabel.text = "Address not found"
            oldAddressLabel.text = ""
        }
        
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
