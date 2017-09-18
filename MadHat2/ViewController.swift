//
//  ViewController.swift
//  MadHat2
//
//  Created by Prashanth Kothapalli on 8/15/17.
//  Copyright © 2017 Prashanth Kothapalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, VLCMediaPlayerDelegate {
    
    let videoList = ["http://62.210.248.96:11000/live/dlayden5000@gmail.com_paid1m/x7oL3srlXN/13239.m3u8",
    "http://62.210.248.96:11000/live/dlayden5000@gmail.com_paid1m/x7oL3srlXN/12135.m3u8",
    "http://185.59.220.134:8080/eurosport1/mpegts", "http://185.59.220.134:8080/sk1/mpegts"]

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(videoList.count)
    } 
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = videoList[indexPath.row]
        
        return(cell)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

