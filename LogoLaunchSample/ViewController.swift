//
//  ViewController.swift
//  LogoLaunchSample
//
//  Created by TakaoAtsushi on 2018/05/27.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var logoImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buildStratView()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        logoAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //twitterのロゴを作成する（起動時）
    func buildStratView() {
        self.view.backgroundColor = UIColor(red: 73/252, green: 159/252, blue: 235/252, alpha: 1.0)
        self.logoImageView = UIImageView(frame: CGRect(x: self.view.bounds.width/2, y: self.view.bounds.height/2, width: 100.0, height: 100.0))
        self.logoImageView.center = self.view.center
        self.logoImageView.image = UIImage(named: "Twitter_Logo_WhiteOnBlue.png")
        self.view.addSubview(self.logoImageView)
        
    }
    
    //twitterのロゴのanimationする
    func logoAnimation() {
        
        //縮小
        UIView.animate(withDuration: 0.3, delay: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            () in
            self.logoImageView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (Bool) in
            if Bool == true{
                //拡大
                UIView.animate(withDuration: 0.3, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    () in
                    self.logoImageView.transform = CGAffineTransform(scaleX: 7.0, y: 7.0)
                    self.logoImageView.alpha = 0
                    
                }, completion: { (Bool) in
                    self.logoImageView.removeFromSuperview()
                    self.view.backgroundColor = UIColor.white
                    
                })
            }
        }
        
        
    }

}

