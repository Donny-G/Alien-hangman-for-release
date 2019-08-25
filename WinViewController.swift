//
//  WinViewController.swift
//  Alien HangMan
//
//  Created by Donny G on 09/05/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    
    var scoreLabel: UILabel!
    var currentScore = 0
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        
        let winImage = UIImageView()
        winImage.translatesAutoresizingMaskIntoConstraints = false
        winImage.image = UIImage(named: "win")
        view.addSubview(winImage)
        
        let youWinImage = UIImageView()
        youWinImage.translatesAutoresizingMaskIntoConstraints = false
        youWinImage.image = UIImage(named: "youWin")
        view.addSubview(youWinImage)
        
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "SCORE: \(currentScore)"
        scoreLabel.textColor = .red
        scoreLabel.shadowColor = .yellow
        scoreLabel.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            winImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            winImage.widthAnchor.constraint(equalToConstant: 400),
            winImage.heightAnchor.constraint(equalToConstant: 400),
            winImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            youWinImage.topAnchor.constraint(equalTo: winImage.bottomAnchor),
            youWinImage.widthAnchor.constraint(equalToConstant: 100),
            youWinImage.heightAnchor.constraint(equalToConstant: 100),
            youWinImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: youWinImage.bottomAnchor, constant: 25),
            scoreLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image: UIImage = UIImage(named: "banner")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
}
