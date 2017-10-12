//
//  TableViewController.swift
//  MadHat2
//
//  Created by Prashanth Kothapalli on 9/28/17.
//  Copyright © 2017 Prashanth Kothapalli. All rights reserved.
//

import UIKit

var videoList = ["http://thepk.co:2086/live/a3rts2l1/ableenpbiliylnann1/317.m3u8",
                 "http://thepk.co:2086/live/a3rts2l1/ableenpbiliylnann1/260.m3u8",
                 "http://thepk.co:2086/live/a3rts2l1/ableenpbiliylnann1/349.m3u8",
                 "http://thepk.co:2086/live/a3rts2l1/ableenpbiliylnann1/308.m3u8"]

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
        performSegue(withIdentifier: "videoView", sender: self)
    }

}
