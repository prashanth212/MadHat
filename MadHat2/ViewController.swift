//
//  ViewController.swift
//  MadHat2
//
//  Created by Prashanth Kothapalli on 8/15/17.
//  Copyright © 2017 Prashanth Kothapalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VLCMediaPlayerDelegate {
    
    @IBOutlet weak var videoView: UIView!
    
    var mediaPlayer = VLCMediaPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add rotation observer
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        //Add tap gesture to movieView for play/pause
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.movieViewTapped(_:)))
        self.videoView.addGestureRecognizer(gesture)
        
        //Add movieView to view controller
        self.view.addSubview(self.videoView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let url = URL(string: videoList[myIndex])
        
        
        let media = VLCMedia(url: url)
        mediaPlayer.media = media
        
        
        mediaPlayer.delegate = self
        mediaPlayer.drawable = self.videoView
        
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
        self.videoView.frame = self.view.frame
        
    }
    
    func movieViewTapped(_ sender: UITapGestureRecognizer) {
        
        if mediaPlayer.isPlaying {
            mediaPlayer.pause()
            
            let remaining = mediaPlayer.remainingTime
            let time = mediaPlayer.time
            
            print("Paused at \(String(describing: time)) with \(String(describing: remaining)) time remaining")
        }
        else {
            mediaPlayer.play()
            print("Playing")
        }
        
    }

}

