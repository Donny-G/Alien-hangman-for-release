//
//  ScoresViewControllerTableViewController.swift
//  Alien HangMan
//
//  Created by Donny G on 26/06/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

class ScoresViewControllerTableViewController: UITableViewController {
    
    var scoreboardDict = [String : Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HIGH SCORES"
        //find imAGE FOR HIGH SCORES
        let image: UIImage = UIImage(named: "scoreboard1")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        tableView.backgroundView = UIImageView(image: UIImage(named: "background6"))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return scoreboardDict.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let valuesFromDictArray = Array(scoreboardDict.values)
        let keysFromDictArray = Array(scoreboardDict.keys)
        cell.textLabel?.text = "Score is \(valuesFromDictArray[indexPath.row])"
        cell.textLabel?.textColor = .white
        cell.textLabel?.shadowColor = .black
        cell.textLabel?.backgroundColor = .black
        cell.textLabel?.layer.borderWidth = 1
        cell.textLabel?.layer.borderColor = UIColor.white.cgColor
     
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
    
        cell.detailTextLabel?.text = keysFromDictArray[indexPath.row]
        cell.detailTextLabel?.textColor = .white
        cell.detailTextLabel?.shadowColor = .black
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 10, weight: .ultraLight)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valuesFromDictArray = Array(scoreboardDict.values)
        let date = Array(scoreboardDict.keys)
        let sharingScore = "My score: \(valuesFromDictArray[indexPath.row]) dd.\(date[indexPath.row])"
        let vc = UIActivityViewController(activityItems: ["\(sharingScore)"], applicationActivities: [])
        vc.popoverPresentationController?.sourceView = self.view
        present(vc, animated: true)
    }
    
}


