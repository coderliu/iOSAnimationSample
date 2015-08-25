//
//  EasingViewController.swift
//  iOSAnimationSample
//
//  Created by 刘岳 on 15/8/19.
//  Copyright (c) 2015年 刘岳. All rights reserved.
//

import UIKit

class EasingViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var redSquare: UIView!
    @IBOutlet weak var greenSquare: UIView!
    @IBOutlet weak var graySquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(2, animations: {
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
        })
        UIView.animateWithDuration(2, delay: 0, options: .CurveEaseIn, animations: {
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
        }, completion: nil)
        UIView.animateWithDuration(2, delay: 0, options: .CurveEaseOut, animations: {
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
            }, completion: nil)
        UIView.animateWithDuration(2, delay: 0, options: .CurveEaseInOut, animations: {
            self.graySquare.center.x = self.view.bounds.width - self.graySquare.center.x
            }, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
