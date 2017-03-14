//
//  PastResultViewController.swift
//  DSteilen-AddressHistory
//
//  Created by Daniel Steilen on 3/14/17.
//  Copyright © 2017 DSteilen. All rights reserved.
//

import UIKit

class PastResultViewController: UIViewController {
    var oldAddress = ""
    var newAddress = ""

    @IBOutlet weak var oldAddressLabel: UILabel!
    @IBOutlet weak var newAddressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        oldAddressLabel.text = oldAddress + " is now:"
        newAddressLabel.text = newAddress
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
