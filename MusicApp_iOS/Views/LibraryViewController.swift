//
//  LibraryViewController.swift
//  MusicApp_iOS
//
//  Created by Anuranjan Bose on 10/05/18.
//  Copyright © 2018 Anuranjan Bose. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var library = MusicLibrary().library

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.dataSource = self
        tableView.delegate = self
        
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! SongTableViewCell
        
        
        cell.songTitleLabel.text = library[indexPath.row]["title"]
        cell.artistLabel.text = library[indexPath.row]["artist"]
        if let coverImage = library[indexPath.row]["coverImage"]
        {
            cell.coverImageView.image = UIImage(named: "\(coverImage).jpg")
        }
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPlayer", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayer" {
            let playerVC = segue.destination as! PlayerViewController
            let indexPath = tableView.indexPathForSelectedRow!
            playerVC.trackId = indexPath.row
            
        }
    }
 

}
