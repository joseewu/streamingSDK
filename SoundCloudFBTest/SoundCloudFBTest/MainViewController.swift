//
//  MainViewController.swift
//  SoundCloudFBTest
//
//  Created by josee on 6/19/16.
//  Copyright © 2016 com.josee. All rights reserved.
//

import UIKit
import Soundcloud
class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var songTable: UITableView!
    
    @IBOutlet weak var imagView: UIImageView!
    var user:User?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imagView.backgroundColor = UIColor.clearColor()
        imagView.layer.cornerRadius = self.imagView.frame.height / 2
        imagView.layer.masksToBounds = true
       songTable.delegate = self
        songTable.dataSource = self
        
       
    }
    func getTracks(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "songCells"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        cell.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        return cell
        
    }
   

}
