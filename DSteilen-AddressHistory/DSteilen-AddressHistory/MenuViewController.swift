//
//  ViewController.swift
//  DSteilen-AddressHistory
//
//  Created by Daniel Steilen on 3/12/17.
//  Copyright © 2017 DSteilen. All rights reserved.
//

import UIKit
import CoreLocation
import AddressBookUI

class MenuViewController: UIViewController {
    //let locationManager = CLLocationManager()
    
    @IBAction func unwindToMenu(_ segue: UIStoryboardSegue) {
        print("Unwind")
    }
    
    /*
    @IBAction func getLocation(_ sender: UIButton) {
        reverseGeocoding(latitude: 37.3316851, longitude: -122.0300674)
    }
     */
    
    /*
    func reverseGeocoding(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                print(error ?? "error")
                return
            }
            else if (placemarks?.count)! > 0 {
                let pm = placemarks![0]
                let address = ABCreateStringWithAddressDictionary(pm.addressDictionary!, false)
                print("\n\(address)")
                if (pm.areasOfInterest?.count)! > 0 {
                    let areaOfInterest = pm.areasOfInterest?[0]
                    print(areaOfInterest!)
                } else {
                    print("No area of interest found.")
                }
            }
        })
    }
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

