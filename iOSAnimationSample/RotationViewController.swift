//
//  RotationViewController.swift
//  iOSAnimationSample
//
//  Created by 刘岳 on 15/8/19.
//  Copyright (c) 2015年 刘岳. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var sensei: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func spin() {
        UIView.animateWithDuration(1, delay: 0, options: .CurveLinear, animations: {
            self.sensei.transform = CGAffineTransformRotate(self.sensei.transform, CGFloat(M_PI))
            }, completion: {
                (finished) -> Void in
                self.spin()
        })
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.spin()
        
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
