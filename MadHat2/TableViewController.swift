//
//  TableViewController.swift
//  MadHat2
//
//  Created by Prashanth Kothapalli on 9/28/17.
//  Copyright © 2017 Prashanth Kothapalli. All rights reserved.
//

import UIKit

var videoList = ["http://thepk.co:2095/live/a3rts2l1/ableenpbiliylnann1/262.m3u8",
                 "http://thepk.co:2095/live/a3rts2l1/ableenpbiliylnann1/267.m3u8",
                 "http://62.210.248.96:11000/live/kitten_paid/kkZpEn7fAy/8009.m3u8",
                 "http://62.210.248.96:11000/live/kitten_paid/kkZpEn7fAy/7994.m3u8"]

var videoDesc = ["HBO", "CNN", "CNBC", "NFL"]
var myIndex = 0

class TableViewController: UITableViewController {

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videoDesc.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = videoDesc[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}
