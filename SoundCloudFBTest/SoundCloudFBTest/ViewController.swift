//
//  ViewController.swift
//  SoundCloudFBTest
//
//  Created by josee on 6/19/16.
//  Copyright © 2016 com.josee. All rights reserved.
//

import UIKit
import Soundcloud
import AVFoundation
class ViewController: UIViewController,AVAudioPlayerDelegate {

    @IBOutlet weak var LoginBut: UIButton!
    
    var user:User?
    var userFavoriteTrack:[Track]?{
        didSet{
            startPlayTracks(userFavoriteTrack)
        }
    }
    var play:AVAudioPlayer!
   // private let appDelegate = AppDelegate()
    
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
        //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let VC = self.storyboard!.instantiateViewControllerWithIdentifier("MainViewController")
        
        
    }

    func startPlayTracks(tracksname:[Track]?){
        
        let trackUrl = tracksname?.first?.streamURL
        play = try? AVAudioPlayer(data: NSData(contentsOfURL: trackUrl!)!)
        play.delegate = self
        play.prepareToPlay()
        play.play()
        
        
    }
    @IBAction func LogIn(sender: UIButton) {
       
        dispatch_async(dispatch_get_main_queue()) {
            Session.login(self, completion: { [weak self] result -> Void in
                
                if (result.response.isSuccessful){
                    
                    self?.getUser()
                }
                
                })
        }
        self.view.backgroundColor  = UIColor.orangeColor()
        
    }
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        play.stop()
        self.userFavoriteTrack?.removeFirst()
        startPlayTracks(self.userFavoriteTrack)
        
    }
    func getUser(){
        
        
        Soundcloud.session?.me({[weak self] result  in
            if (result.response.isSuccessful){
                
            self?.user = result.response.result
                self?.getTracks()
            }
        })
        
    }
    
    func getTracks(){
        self.user?.favorites({[weak self] results in
             if (results.response.isSuccessful){
                
            self?.userFavoriteTrack = results.response.result
                
            
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

