//
//  ViewController.swift
//  SoundCloudFBTest
//
//  Created by josee on 6/19/16.
//  Copyright © 2016 com.josee. All rights reserved.
//

import UIKit
import Soundcloud
class ViewController: UIViewController {

    
    var user:User?
   // private let appDelegate = AppDelegate()
    
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
        //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let VC = self.storyboard!.instantiateViewControllerWithIdentifier("MainViewController")
        
        
    }

    
    @IBAction func LogIn(sender: UIButton) {
         let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        Session.login(self, completion: { result -> Void in
                        if (result.response.isSuccessful){
                            
                        
                            self.getUser()
                            dispatch_async(dispatch_get_main_queue()) {
                                self.dismissViewControllerAnimated(true, completion: nil)
                                
                                appDelegate.didLogInSoundCloud()
                            }
                            
                            
                            
             }
        })

    }
    func getUser(){
        Soundcloud.session?.me({ result  in
            self.user = result.response.result
            if let user = result.response.result {
                print(user)
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

