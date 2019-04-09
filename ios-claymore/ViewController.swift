//
//  ViewController.swift
//  ios-claymore
//
//  Created by Angela Pan on 4/8/19.
//  Copyright © 2019 Angela Pan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "...";
        
        Alamofire.request("http://127.0.0.1:8000/users/api/games/?term=Casino").responseJSON { (response) in
            //print(response)
            
            if let gameJSON = response.result.value {
                let json = JSON(gameJSON)
                let gameArray = json[0]["pk"]
                
                print("result:\(gameArray)")
                self.label.text = "\(gameArray)"
              
            }
        }

    }
    
}
