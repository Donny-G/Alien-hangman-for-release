//
//  HighScoreViewController.swift
//  Alien HangMan
//
//  Created by DeNNiO   G on 08/07/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {

    var scoreLabel: UILabel!
    var highscore = 0
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        
        let winImage = UIImageView()
        winImage.translatesAutoresizingMaskIntoConstraints = false
        //FIND IMAGE !
        winImage.image = UIImage(named: "highscore4")
        view.addSubview(winImage)
        
        let recordImageView = UIImageView()
        recordImageView.translatesAutoresizingMaskIntoConstraints = false
        //FIND IMAGE!
        recordImageView.image = UIImage(named: "record1")
        view.addSubview(recordImageView)
        
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "NEW RECORD: \(highscore)"
        scoreLabel.textColor = .red
        scoreLabel.shadowColor = .yellow
        scoreLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            winImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            winImage.widthAnchor.constraint(equalToConstant: 400),
            winImage.heightAnchor.constraint(equalToConstant: 400),
            winImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            recordImageView.topAnchor.constraint(equalTo: winImage.bottomAnchor),
            recordImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordImageView.widthAnchor.constraint(equalToConstant: 140),
            recordImageView.heightAnchor.constraint(equalToConstant: 140),
            
            scoreLabel.topAnchor.constraint(equalTo: recordImageView.bottomAnchor),
            scoreLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5)
            
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        let image: UIImage = UIImage(named: "youwin3")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
    }

    @objc func share (){
        let scoreToShare = "My new record is \(highscore)"
        let vc = UIActivityViewController(activityItems: [scoreToShare], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
