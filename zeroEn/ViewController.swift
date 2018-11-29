//
//  ViewController.swift
//  zeroEn
//
//  Created by sbc on 2018/11/16.
//  Copyright © 2018年 cpi. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage! = UIImage(named: "initial.jpg")
    
    @IBOutlet weak var choosePhotoBtn: UIButton!
    @IBOutlet weak var mergePhotoBtn: UIButton!
    @IBOutlet weak var mergePhotoBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // デフォルトの画像を表示する
        imageView.image = UIImage(named: "initial.jpg")
        
        choosePhotoBtn.layer.masksToBounds = true;
        choosePhotoBtn.layer.cornerRadius = 10.0
        mergePhotoBtn.layer.masksToBounds = true;
        mergePhotoBtn.layer.cornerRadius = 10.0
        mergePhotoBtn2.layer.masksToBounds = true;
        mergePhotoBtn2.layer.cornerRadius = 10.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

    @IBAction func choosePhoto(_ sender: UIButton) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // [.camera]にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
    
    
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 選択した写真を取得する
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        // ビューに表示する
        self.imageView.image = image
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
    
    
    @IBAction func mergePhoto(_ sender: UIButton) {
        // アラートで確認
        let alert = UIAlertController(title: "確認", message: "ロゴ1を入れても宜しいですか？", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler:{(action: UIAlertAction) -> Void in
            // デフォルトの画像を表示する
            let width = self.image.size.width
            let height = self.image.size.height
            print("width:",width,"/height:",height)
            let myImage1 = self.image!
            let myImage2 = UIImage(named: "logo1.png")!
            
            self.imageView.image = self.image.synthesizeImage(UIImageArray: [myImage1,myImage2], size: self.image.size)
        })
        let cancelButton = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        // アラートにボタン追加
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        // アラート表示
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func mergePhoto2(_ sender: UIButton) {
        // アラートで確認
        let alert = UIAlertController(title: "確認", message: "ロゴ2を入れても宜しいですか？", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler:{(action: UIAlertAction) -> Void in
            // デフォルトの画像を表示する
            let width = self.image.size.width
            let height = self.image.size.height
            print("width:",width,"/height:",height)
            let myImage1 = self.image!
            let myImage2 = UIImage(named: "logo2.png")!
            
            self.imageView.image = self.image.synthesizeImage(UIImageArray: [myImage1,myImage2], size: self.image.size)
        })
        let cancelButton = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        // アラートにボタン追加
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        // アラート表示
        present(alert, animated: true, completion: nil)
    }
}

