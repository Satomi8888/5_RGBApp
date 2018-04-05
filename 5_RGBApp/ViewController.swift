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
    //rのカラーコード
    var rCode:Float = 1.0
    //gのカラーコード
    var gCode:Float = 1.0
    //bのカラーコード
    var bCode:Float = 1.0
    //スライダーで指定したカラーコード
    var colorCode:String = ""

    
    //Rスライダーの動作
    @IBAction func rSliderAction(_ sender: UISlider) {
        //コードの数値を変数に入れる
        rCode = sender.value
        //コードの数値をLabelに反映する
        rLabel.text = "R:\(Int(rCode))"
        //テストラベルに背景を反映する
        labelChange()
    }
    
    //Gスライダーの動作
    @IBAction func gSliderAction(_ sender: UISlider) {
        //コードの数値を変数に入れる
        gCode = sender.value
        //コードの数値をLabelに反映する
        gLabel.text = "G:\(Int(gCode))"
        //テストラベルに背景を反映する
        labelChange()
    }

    //Bスライダーの動作
    @IBAction func bSliderAction(_ sender: UISlider) {
        //コードの数値を変数に入れる
        bCode = sender.value
        //コードの数値をLabelに反映する
        bLabel.text = "B:\(Int(bCode))"
        //テストラベルに背景を反映する
        labelChange()
    }
    
    
    //ラベルの色と文字を変更する
    func labelChange() {
        //背景色を変更する（不要）
        colorCodeLabel.backgroundColor = UIColor(red: CGFloat(rCode)/255.0, green: CGFloat(gCode)/255.0, blue: CGFloat(bCode)/255.0, alpha: 1.0)
        //RGBを16進数に変更する
        colorCode = String(NSString(format: "%02x%02x%02x", Int(rCode), Int(gCode), Int(bCode))).uppercased()
        //ラベルのテキストを変更する
        colorCodeLabel.text = "RGB value is #" + colorCode
        //テーブルを更新する
        colorTableView.reloadData()
    }
    
    //テーブルビュー
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数を指定
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorTableViewCell", for: indexPath)
        
        cell.backgroundColor = UIColor(red: CGFloat(rCode)/255.0, green: CGFloat(gCode)/255.0, blue: CGFloat(bCode)/255.0, alpha: 1.0)
        cell.textLabel?.text = colorCode
        return cell
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

