//
//  ViewController.swift
//  MusicApp_iOS
//
//  Created by Anuranjan Bose on 10/05/18.
//  Copyright © 2018 Anuranjan Bose. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    
    var trackId : Int = 0
    var library = MusicLibrary().library
    
    var audioPlayer : AVAudioPlayer!

    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        
        
        coverImageView.image = UIImage(named: "\(library[trackId]["coverImage"]!).jpg")
        songTitleLabel.text = library[trackId]["title"]
        artistLabel.text = library[trackId]["artist"]
        
        let audioSourceURL: URL!
        
        audioSourceURL = Bundle.main.url(forResource: "\(trackId)", withExtension: "mp3")
        
        if audioSourceURL == nil {
            print("Requested song cant be played")
        }
        else
        {
            do {
                audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourceURL!)
                audioPlayer.play()
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayerViewController.updateProgressView), userInfo: nil, repeats: true)
                
                progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
            }
            catch {
                print(error)
            }
            
        }
        
        
        
        
    }
    
    @objc func updateProgressView() {
        if audioPlayer.isPlaying {
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }
    
    
    @IBAction func pauseAction(_ sender: UIButton) {
        audioPlayer.pause()
    }
    
   
    @IBAction func playAction(_ sender: UIButton) {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
        }
    }
    
    
    @IBAction func stopAction(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        progressView.progress = 0
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

