//
//  AddGoalController.swift
//  Bbetter_app
//
//  Created by 모바일인터넷과 on 2022/04/20.
//

import UIKit

class AddGoalController: UIViewController {
    
    @IBOutlet weak var Gname: UITextField!

    var data: [String] = ["data1"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveGoal(_sender: Any){
        data.append(Gname.text!)
        print(data)
        
    }
    
}
