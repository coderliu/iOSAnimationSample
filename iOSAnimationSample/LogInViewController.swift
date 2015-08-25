//
//  LogInViewController.swift
//  iOSAnimationSample
//
//  Created by 刘岳 on 15/8/24.
//  Copyright (c) 2015年 刘岳. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var bubble1: UIImageView!
    @IBOutlet weak var bubble2: UIImageView!
    @IBOutlet weak var bubble3: UIImageView!
    @IBOutlet weak var bubble4: UIImageView!
    @IBOutlet weak var bubble5: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var dot: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    let warningMessage = UIImageView(image: UIImage(named: "warningMessage"))
    var loginPositon = CGPoint.zeroPoint
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bubble1.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble2.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble3.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble4.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble5.transform = CGAffineTransformMakeScale(0, 0)
        
        self.logo.center.x -= self.view.bounds.width
        self.dot.center.x -= self.view.bounds.width/3
        self.username.center.x -= self.view.bounds.width
        self.password.center.x -= self.view.bounds.width
        
        self.loginPositon = self.login.center
        self.login.center.x -= self.view.bounds.width
        
        // MARK: - Padding for Text Field
        let usernamePaddingView = UIView(frame: CGRectMake(0, 0, 51, username.bounds.height))
        username.leftView = usernamePaddingView
        username.leftViewMode = UITextFieldViewMode.Always
        
        let passwordPaddingView = UIView(frame: CGRectMake(0, 0, 51, password.bounds.height))
        password.leftView = passwordPaddingView
        password.leftViewMode = UITextFieldViewMode.Always
        
        // MARK: - Add icon to Text Field as subview
        var usernameImageView = UIImageView(image: UIImage(named: "fa-user"))
        usernameImageView.frame.origin = CGPoint(x: 17, y: 10)
        self.username.addSubview(usernameImageView)
        
        var passwordImageView = UIImageView(image: UIImage(named: "fa-key"))
        passwordImageView.frame.origin = CGPoint(x: 15, y: 10)
        self.password.addSubview(passwordImageView)
        
        self.view.addSubview(warningMessage)
        warningMessage.hidden = true
        self.warningMessage.center = loginPositon

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: nil, animations: {
            self.bubble1.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble3.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: nil, animations: {
            self.bubble2.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble5.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: nil, animations: {
            self.bubble4.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            self.logo.center.x += self.view.bounds.width
        }, completion: nil)
        UIView.animateWithDuration(5, delay: 0.4, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: nil, animations: {
            self.dot.center.x += self.view.bounds.width/3
        }, completion: nil)
        UIView.animateWithDuration(0.4, delay: 0.5, options: .CurveEaseOut, animations: {
            self.username.center.x += self.view.bounds.width
        }, completion: nil)
        UIView.animateWithDuration(0.4, delay: 0.6, options: .CurveEaseOut, animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        UIView.animateWithDuration(0.4, delay: 0.7, options: .CurveEaseOut, animations: {
            self.login.center.x += self.view.bounds.width
            }, completion: nil)
    }
    
    // Mark: - Hide Keyboard while tap
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        username.resignFirstResponder()
        password.resignFirstResponder()
        
        self.login.addSubview(spinner)
        spinner.frame.origin = CGPoint(x: 6, y: 11)
        spinner.startAnimating()
        
        UIView.transitionWithView(self.warningMessage, duration: 0.3, options: .TransitionFlipFromBottom, animations: {
            self.warningMessage.hidden = true
        }, completion: nil)
        
        UIView.animateWithDuration(0.3, animations: {
            self.login.center = self.loginPositon
        })
        
        self.login.center.x -= 30
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: nil, animations: {
            self.login.center.x += 30
            }, completion: { _ in
                UIView.animateWithDuration(0.3, animations: {
                    self.login.center.y += 80
                    self.spinner.stopAnimating()
                    }, completion: { _ in
                        UIView.transitionWithView(self.warningMessage, duration: 0.3, options: .TransitionFlipFromTop | .CurveEaseOut, animations: {
                            self.warningMessage.hidden = false
                        }, completion: nil)
                    })
        })
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
