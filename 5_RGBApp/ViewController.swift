//
//  ViewController.swift
//  5_RGBApp
//
//  Created by 遠山　聡美 on 2018/03/21.
//  Copyright © 2018年 Simple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    
    //Rのラベル
    @IBOutlet weak var rLabel: UILabel!
    //Gのラベル
    @IBOutlet weak var gLabel: UILabel!
    //Bのラベル
    @IBOutlet weak var bLabel: UILabel!
    //色の表示をテストするためのラベル
    @IBOutlet weak var colorCodeLabel: UILabel!
    //色を表示するテーブル
    @IBOutlet weak var colorTableView: UITableView!

    
    //Rスライダーの動作
    @IBAction func rSliderAction(_ sender: UISlider) {
        //スライダーラベルに値を反映する
        changeSliderLabel(code: sender.value, sliderLabel: rLabel)
        //メインラベルにカラーコードを反映する
        changeMainLabel()
    }
    
    //Gスライダーの動作
    @IBAction func gSliderAction(_ sender: UISlider) {
        //スライダーラベルに値を反映する
        changeSliderLabel(code: sender.value, sliderLabel: gLabel)
        //メインラベルにカラーコードを反映する
        changeMainLabel()
    }

    //Bスライダーの動作
    @IBAction func bSliderAction(_ sender: UISlider) {
        //スライダーラベルに値を反映する
        changeSliderLabel(code: sender.value, sliderLabel: bLabel)
        //メインラベルにカラーコードを反映する
        changeMainLabel()
    }
    
    //スライダーラベルを変更する
    func changeSliderLabel(code:Float, sliderLabel:UILabel) {
        sliderLabel.text = String(Int(code))
    }
    
    //メインラベルを変更する
    func changeMainLabel() {
        //RGBを16進数に変更する
        let colorCode = String(NSString(format: "%02x%02x%02x", Int(rLabel.text!)!,Int(gLabel.text!)!,Int(bLabel.text!)!)).uppercased()
        //ラベルのテキストを変更する
        colorCodeLabel.text = "RGB value is #" + colorCode
        //テーブルを更新する
        colorTableView.reloadData()
    }
    
    //テーブルビュー
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数を指定
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorTableViewCell", for: indexPath)
        
        //各セルのRGBの値
        var cellRCode = Int(rLabel.text!)!
        var cellGCode = Int(gLabel.text!)!
        var cellBCode = Int(bLabel.text!)!
        
        //セルごとにコードを変更する
        switch indexPath.row {
        case 1:
            cellRCode = checkColorCodeNumber(cellRCode - 20)
        case 2:
            cellRCode = checkColorCodeNumber(cellRCode - 10)
        case 3:
            cellRCode = checkColorCodeNumber(cellRCode + 10)
        case 4:
            cellRCode = checkColorCodeNumber(cellRCode + 20)
        case 5:
            cellGCode = checkColorCodeNumber(cellGCode - 20)
        case 6:
            cellGCode = checkColorCodeNumber(cellGCode - 10)
        case 7:
            cellGCode = checkColorCodeNumber(cellGCode + 10)
        case 8:
            cellGCode = checkColorCodeNumber(cellGCode + 20)
        case 9:
            cellBCode = checkColorCodeNumber(cellBCode - 20)
        case 10:
            cellBCode = checkColorCodeNumber(cellBCode - 10)
        case 11:
            cellBCode = checkColorCodeNumber(cellBCode + 10)
        case 12:
            cellBCode = checkColorCodeNumber(cellBCode + 20)
        default:
            break
        }
        
        //セルの背景色を変更する
        cell.backgroundColor = UIColor(red: CGFloat(cellRCode)/255.0, green: CGFloat(cellGCode)/255.0, blue: CGFloat(cellBCode)/255.0, alpha: 1.0)
       //セルにカラーコードを表示する
        cell.textLabel?.text = "#" + String(NSString(format: "%02x%02x%02x", cellRCode, cellGCode, cellBCode)).uppercased()
        return cell
    }

    
    //RGBの数値が0〜255の範囲にする
    func checkColorCodeNumber(_ num:Int) -> Int {
        if num > 255 {
            return 255
        }
        if num < 0 {
            return 0
        }
        return num
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.delegate = self
        colorTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

