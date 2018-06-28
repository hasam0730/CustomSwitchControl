//
//  ViewController.swift
//  CustomSwitch
//
//  Created by hieu nguyen on 6/28/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchView: PRSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        switchView.handleChangeSwitchState = { isOn in
//            print("dung hay sai: \(isOn)")
//        }
    }

    @IBAction func action(_ sender: Any) {
        print(switchView.isOn)
    }
    
    @IBAction func changeValue(_ sender: PRSwitch) {
        print(sender.isOn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

