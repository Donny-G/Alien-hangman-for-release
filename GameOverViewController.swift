//
//  GameOverViewController.swift
//  Alien HangMan
//
//  Created by Donny G on 09/05/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var wordLabel: UILabel!
    var word = ""
    
    var scoreLabel: UILabel!
    var score = 0
    override func loadView() {
        view = UIView()
        
        let gameOverImageView1 = UIImageView()
        gameOverImageView1.translatesAutoresizingMaskIntoConstraints = false
        gameOverImageView1.image = UIImage(named: "gameover")
        view.addSubview(gameOverImageView1)
        
        let gameOverImageView2 = UIImageView()
        gameOverImageView2.translatesAutoresizingMaskIntoConstraints = false
        gameOverImageView2.image = UIImage(named: "gameoverLogo")
        view.addSubview(gameOverImageView2)
        
        let wordLabel = UILabel()
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.text = "The word is \(word)"
        wordLabel.textColor = .red
        wordLabel.shadowColor = .yellow
        wordLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(wordLabel)
        
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "SCORE: \(score)"
        scoreLabel.textColor = .red
        scoreLabel.shadowColor = .yellow
        scoreLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(scoreLabel)
        
        let tryAgainImageView = UIImageView()
        tryAgainImageView.translatesAutoresizingMaskIntoConstraints = false
        tryAgainImageView.image = UIImage(named: "tryAgain")
        
        view.addSubview(tryAgainImageView)
    
        NSLayoutConstraint.activate([
            gameOverImageView1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            gameOverImageView1.widthAnchor.constraint(equalToConstant: 400),
            gameOverImageView1.heightAnchor.constraint(equalToConstant: 400),
            gameOverImageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gameOverImageView2.topAnchor.constraint(equalTo: gameOverImageView1.bottomAnchor),
            gameOverImageView2.widthAnchor.constraint(equalToConstant: 60),
            gameOverImageView2.heightAnchor.constraint(equalToConstant: 60),
            gameOverImageView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(lessThanOrEqualTo: gameOverImageView2.bottomAnchor, constant: 10),
            scoreLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            wordLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            wordLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            wordLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tryAgainImageView.topAnchor.constraint(lessThanOrEqualTo: wordLabel.bottomAnchor, constant: 10),
            tryAgainImageView.widthAnchor.constraint(equalToConstant: 60),
            tryAgainImageView.heightAnchor.constraint(equalToConstant: 60),
            tryAgainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image: UIImage = UIImage(named: "banner2")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
}
