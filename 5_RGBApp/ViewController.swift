//
//  ViewController.swift
//  5_RGBApp
//
//  Created by 遠山　聡美 on 2018/03/21.
//  Copyright © 2018年 Simple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Rのラベル
    @IBOutlet weak var rLabel: UILabel!
    //Gのラベル
    @IBOutlet weak var gLabel: UILabel!
    //Bのラベル
    @IBOutlet weak var bLabel: UILabel!
    
    
    //Rスライダーの動作
    @IBAction func rSliderAction(_ sender: UISlider) {
        rLabel.text = "R:\(Int(sender.value))"
    }
    
    //Gスライダーの動作
    @IBAction func gSliderAction(_ sender: UISlider) {
        gLabel.text = "G:\(Int(sender.value))"
    }

    //Bスライダーの動作
    @IBAction func bSliderAction(_ sender: UISlider) {
        bLabel.text = "B:\(Int(sender.value))"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

