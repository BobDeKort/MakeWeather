//
//  ViewController.swift
//  MakeWeather-starter
//
//  Created by Nikolas Burk on 19/09/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import YWeatherAPI

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTxt: UITextField!

    @IBOutlet weak var lowestLbl: UILabel!
    
    @IBOutlet weak var highestLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var inputCity = ""
    
    @IBAction func goBtnPressed(_ sender: AnyObject) {
        if (inputTxt.text != nil){
            inputCity = inputTxt.text!
            
            YWeatherAPI.sharedManager().todaysForecast(forLocation:  inputCity,
                                                       success: { (result: [AnyHashable: Any]?) in
                                                        print(result)
                                                        self.lowestLbl.text = result?[AnyHashable("lowTemperatureForDay")] as? String
                                                        self.highestLbl.text = result?[AnyHashable("highTemperatureForDay")] as? String
                                                        self.descriptionLbl.text = result? [AnyHashable("shortDescription")] as? String
                                                        
                },
                                                       failure: { (response: Any?, error: Error?) in
                                                        print(error)
                                                    
                }
                
            )
        }
    }
    
    @IBAction func next5DaysBtn(_ sender: AnyObject) {
        
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()

    YWeatherAPI.sharedManager().todaysForecast(forLocation: "San Francisco",
                                               success: { (result: [AnyHashable: Any]?) in
                                                print("START \(result) STOP")
      },
                                               failure: { (response: Any?, error: Error?) in
                                                print(error)
      }

    )
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

