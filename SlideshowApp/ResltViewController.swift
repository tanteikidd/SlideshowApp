//
//  ResltViewController.swift
//  SlideshowApp
//
//  Created by 川井康太郎 on 2020/09/06.
//  Copyright © 2020 kotaro_kawai. All rights reserved.
//

import UIKit

class ResltViewController: UIViewController {
    @IBOutlet weak var detail: UIImageView!
    
    var x:Int? = 0
  let images = [UIImage(named: "image1.png"), UIImage(named: "image2.png"), UIImage(named: "image3.png")]

    override func viewDidLoad() {
        super.viewDidLoad()
        switch x {
        case 0:
            detail.image = images[0]
        case 1:
            detail.image = images[1]
        case 2:
            detail.image = images[2]
        case 3:
            x = 1
            detail.image = images[0]

            
        default:
            detail.image = images[0];
            //持ってきたxの値それぞれに写真を与える
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
