//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    var listOfSongs = Song.loveSongs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") {
            cell.textLabel?.text = songSearchResults[indexPath.row].name
            cell.detailTextLabel?.text = songSearchResults[indexPath.row].artist
            return cell
        }
        return UITableViewCell()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError ("No identifier in segue") }
        
        switch segueIdentifier {
        case "segueToDetailVC":
            guard let songDetailVC = segue.destination as? DetailSongViewController
                else { fatalError ("Unexpected segue") }
            guard let selectedIndexPath = tableViewOutlet.indexPathForSelectedRow else { fatalError("No row selected")
            }
            songDetailVC.selectedCell = songSearchResults[selectedIndexPath.row]
        default:
            fatalError("Unexpected segue identifier")
        }
    }
    
    var songSearchResults: [Song] {
        get {
            guard let searchString = searchString else {
                return listOfSongs
            }
            guard searchString != "" else {
                return listOfSongs
            }
            if let scopeTitles = searchBarOutlet.scopeButtonTitles {
                let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex] {
                case "Song":
                    return listOfSongs.filter{$0.name.contains(searchString)}
                case "Artist":
                    return listOfSongs.filter{$0.artist.contains(searchString)}
                default:
                    return listOfSongs
                }
            }
            return listOfSongs
        }
    }
    var searchString: String? = nil {
        didSet {
            self.tableViewOutlet.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        searchBarOutlet.delegate = self
  
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

