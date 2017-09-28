//
//  ViewController.swift
//  MadHat2
//
//  Created by Prashanth Kothapalli on 8/15/17.
//  Copyright © 2017 Prashanth Kothapalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VLCMediaPlayerDelegate {
    
    var movieView: UIView!
    var mediaPlayer = VLCMediaPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add rotation observer
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        //Setup movieView
        self.movieView = UIView()
        self.movieView.backgroundColor = UIColor.gray
        self.movieView.frame = UIScreen.screens[0].bounds
        
        //Add tap gesture to movieView for play/pause
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.movieViewTapped(_:)))
        self.movieView.addGestureRecognizer(gesture)
        
        //Add movieView to view controller
        self.view.addSubview(self.movieView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let url = URL(string: videoList[myIndex])
        
        
        let media = VLCMedia(url: url)
        mediaPlayer.media = media
        
        
        mediaPlayer.delegate = self
        mediaPlayer.drawable = self.movieView
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func rotated() {
        
        let orientation = UIDevice.current.orientation
        
        if (UIDeviceOrientationIsLandscape(orientation)) {
            print("Switched to landscape")
        }
        else if(UIDeviceOrientationIsPortrait(orientation)) {
            print("Switched to portrait")
        }
        
        //Always fill entire screen
        self.movieView.frame = self.view.frame
        
    }
    
    func movieViewTapped(_ sender: UITapGestureRecognizer) {
        
        if mediaPlayer.isPlaying {
            mediaPlayer.pause()
            
            let remaining = mediaPlayer.remainingTime
            let time = mediaPlayer.time
            
            print("Paused at \(time) with \(remaining) time remaining")
        }
        else {
            mediaPlayer.play()
            print("Playing")
        }
        
    }

}

