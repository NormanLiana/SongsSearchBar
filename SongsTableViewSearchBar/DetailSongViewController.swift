//
//  DetailSongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Liana Norman on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailSongViewController: UIViewController {

    var selectedCell: Song!
    
    @IBOutlet weak var detailSongArtistOutlet: UILabel!
    @IBOutlet weak var detailSongTitleOutlet: UILabel!
    @IBOutlet weak var detailImageOutlet: UIImageView!
    
    override func viewDidLoad() {
        detailImageOutlet.image = UIImage(named: "loveSongs")
        detailSongTitleOutlet.text = selectedCell.name
        detailSongArtistOutlet.text = selectedCell.artist
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
