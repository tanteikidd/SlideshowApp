//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 川井康太郎 on 2020/09/03.
//  Copyright © 2020 kotaro_kawai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var next1: UIButton!
    @IBOutlet weak var back1: UIButton!
    @IBOutlet weak var play1: UIButton!
    
       
       var status:Bool! = true
       
       var backtype:Bool! = true
    
       var timer: Timer!
    
       var imageIndex:Int! = 0
    
    //   var  tappedImage :UIImage?
    
       let images = [UIImage(named: "image1.png"), UIImage(named: "image2.png"), UIImage(named: "image3.png")]
       //3枚の画像のUIImage化
    
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       
       self.back1.isEnabled = true
       self.next1.isEnabled = true
              
        
       let imageView = images[0]
    
       ImageView.image = imageView

        
      
    
    }


    
    //戻るアクション
    @IBAction func back1(_ sender: Any){
        if imageIndex == 0 {
            imageIndex = 2
        } else{
            imageIndex -= 1
        }
        //0,2,1,0,2,1,0,2の順で戻っていくから0になったときに2にするようなif文を作る
        
        ImageView.image = images[imageIndex]
    }
    
    //進むアクション
    @IBAction func next1(_ sender: Any){
        if imageIndex == 2 {
            imageIndex = 0
        } else{
            imageIndex += 1
        }
        //0,1,2,0,1,2,0の順で進んでいくから2になったときに0にするようなif文を作る
        
        ImageView.image = images[imageIndex]
    }
 
    //再生/一時停止アクション
   @IBAction func play1(_ sender: Any) {
         backtype = false
         if(status == true) {
             status = false
             self.back1.isEnabled = false
             self.next1.isEnabled = false
            //再生中は他のボタンを押せない
             play1.setTitle("停止", for: .normal)
            //停止と表記する
            if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            //2秒ごとに進める
            }
             
         } else {
             status = true
             self.back1.isEnabled = true
             self.next1.isEnabled = true
            //停止中は他のボタンが押せる
             play1.setTitle("再生", for: .normal)
             if self.timer != nil {
                 self.timer.invalidate()
                 self.timer = nil
             }
         }
     
    }
    @objc func onTimer(_ timer: Timer){
        if imageIndex == 2{
            imageIndex = 0
        }else {
            imageIndex += 1
        }
        ImageView.image = images[imageIndex]
        //再生時のスライドショーの表示
        //進むアクションと同じように動かす
    }
    @IBAction func tap(_ sender : Any){}
        //タップされた画像を次のページに遷移する
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let a:ResltViewController = segue.destination as! ResltViewController
        a.x = imageIndex!
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
}
//check再生中は他のボタンを押せない
//check再生中に再生ボタンを押すと停止
//画像をクリックするとその画像を次のページに移す
//check遷移をする
