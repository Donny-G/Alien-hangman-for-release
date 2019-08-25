//
//  ViewController.swift
//  Alien HangMan
//
//  Created by Donny G on 04/05/2019.
//  Copyright © 2019 Donny G. All rights reserved.
//

import UIKit

extension Date {
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return dateFormatter.string(from: Date())
    }
}

class ViewController: UIViewController {
    
    var scoreLabel: UILabel!
    var tmpScore = 0
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var scoresDictionary = [String: Int]()
    
    var tmpHighscore = 0
    
    var levelLabel: UILabel!
    var level = 1 {
        didSet{
            levelLabel.text = "Level: \(level)"
        }
    }
    
    var cluesLabel: UILabel!
    var cluesArray = [String]()
    var clue: String!
    
    var mysteryWordLabel: UILabel!
    var mysteryWords = [String]()
    var mysteryWord: String!
    
    var letterButtons = [UIButton]()
    var usedLetters = [String]()
    var tappedLetters: String!
    
    var alienStagesImageViewArray: [UIImage] = [
        UIImage(named: "stage0")!,
        UIImage(named: "stage1")!,
        UIImage(named: "stage2")!,
        UIImage(named: "stage3")!,
        UIImage(named: "stage4")!,
        UIImage(named: "stage5")!,
        UIImage(named: "stage6")!,
        UIImage(named: "stage7")!,
    ]
    var newGameImage = UIImage(named: "stage0")
    var alienStagesImageView: UIImageView!
    
    var lifesLabel: UILabel!
    var index = 0
    var lifes = 7 {
        didSet {
            lifesLabel.text = "Life: \(lifes)"
            alienStagesImageView.image = alienStagesImageViewArray[index + 1]
        }
    }
    var usedLifes: Int!
    
    override func loadView() {
        view = UIView()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImage.image = UIImage(named: "background1")
        backgroundImage.contentMode = UIImageView.ContentMode.scaleAspectFill
        view.addSubview(backgroundImage)
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: \(score)"
        scoreLabel.textColor = .green
        scoreLabel.shadowColor = .red
        scoreLabel.textAlignment = .right
        view.addSubview(scoreLabel)
        
        levelLabel = UILabel()
        levelLabel.textColor = .green
        levelLabel.shadowColor = .red
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.text = "Level: 1"
        levelLabel.textAlignment = .right
        view.addSubview(levelLabel)
        
        lifesLabel = UILabel()
        lifesLabel.textColor = .green
        lifesLabel.shadowColor = .red
        lifesLabel.translatesAutoresizingMaskIntoConstraints = false
        lifesLabel.text = "Life: \(lifes)"
        lifesLabel.textAlignment = .right
        view.addSubview(lifesLabel)
    
        let hintLabel = UILabel()
        hintLabel.textColor = .green
        hintLabel.shadowColor = .red
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        hintLabel.text = "HINT:"
        view.addSubview(hintLabel)
        
        alienStagesImageView = UIImageView()
        alienStagesImageView.image = alienStagesImageViewArray[0]
        alienStagesImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alienStagesImageView)
        
        cluesLabel = UILabel()
        cluesLabel.textColor = .green
        cluesLabel.shadowColor = .red
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.text = ""
        view.addSubview(cluesLabel)
        
        let lettersView = UIView()
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lettersView)
        mysteryWordLabel = UILabel()
        mysteryWordLabel.textColor = .green
        mysteryWordLabel.shadowColor = .red
        mysteryWordLabel.backgroundColor = .black
        mysteryWordLabel.layer.borderWidth = 2
        mysteryWordLabel.layer.borderColor = UIColor.yellow.cgColor
        mysteryWordLabel.font = UIFont.systemFont(ofSize: 30)
        mysteryWordLabel.translatesAutoresizingMaskIntoConstraints = false
        mysteryWordLabel.textAlignment = .center
        mysteryWordLabel.text = ""
        view.addSubview(mysteryWordLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(lessThanOrEqualTo: levelLabel.layoutMarginsGuide.trailingAnchor, constant: 90),
            
            levelLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            levelLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor, constant: -150),
            
            lifesLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            lifesLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            hintLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            hintLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
         
            cluesLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            cluesLabel.leadingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor, constant: 50),
            
            mysteryWordLabel.widthAnchor.constraint(equalToConstant: 300),
            mysteryWordLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            mysteryWordLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            mysteryWordLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 5),
        
            alienStagesImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alienStagesImageView.topAnchor.constraint(lessThanOrEqualTo: mysteryWordLabel.bottomAnchor, constant: 5),
            alienStagesImageView.heightAnchor.constraint(equalToConstant: 290),
            alienStagesImageView.widthAnchor.constraint(equalToConstant: 280),
            
            lettersView.widthAnchor.constraint(lessThanOrEqualToConstant: 350),
            lettersView.heightAnchor.constraint(lessThanOrEqualToConstant: 240),
            lettersView.topAnchor.constraint(lessThanOrEqualTo: alienStagesImageView.bottomAnchor, constant: 5),
            lettersView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ])
    
        let letterWidth = 50
        let letterHeight = 60
        for row in 0..<4 {
            for col in 0..<7 {
            let letterButton = UIButton(type: .system)
                letterButton.setTitle("X", for: .normal)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            let frame = CGRect(x: col * letterWidth, y: row * letterHeight, width: letterWidth, height: letterHeight)
            letterButton.frame = frame
            lettersView.addSubview(letterButton)
                letterButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            letterButtons.append(letterButton)
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "NEW GAME", style: .plain, target: self, action: #selector(newGame))
        
        let scoreboardButton = UIBarButtonItem(title: "SCOREBOARD", style: .plain, target: self, action: #selector(scoreBoard))
        
        let infoButton = UIBarButtonItem(title: "INFO", style: .plain, target: self, action: #selector(info))
        navigationItem.rightBarButtonItems = [infoButton, scoreboardButton]
        
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.barStyle = .blackTranslucent
        let backItem = UIBarButtonItem()
        backItem.title = "NEW GAME"
        
        navigationItem.backBarButtonItem = backItem
        
        let image: UIImage = UIImage(named: "banner1")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            self?.loadLevel()
            self?.loadButtons()
            self?.loadData()
        }
    }
    
    @objc  func loadLevel() {
        if let urlForLevel = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
            if let contentsOfLevel = try? String(contentsOf: urlForLevel){
                 mysteryWords = contentsOfLevel.components(separatedBy: "\n")
                cluesArray = contentsOfLevel.components(separatedBy: "\n")
            }
        }
        DispatchQueue.main.async {
            [weak self] in
    
            self?.mysteryWords.removeFirst()
            self?.mysteryWords.shuffle()
            self?.mysteryWord = self?.mysteryWords.randomElement()
            self?.clue = self?.cluesArray.first
            self?.cluesLabel.text = self?.clue
            self?.mysteryWordLabel.text = "Guess the word"
            self?.usedLetters.removeAll()
            self?.usedLifes = 0
            self?.lifes = self!.mysteryWord.count
            self?.alienStagesImageView.image = self?.newGameImage
            for button in self!.letterButtons {
            button.isHidden = false
            }
        }
    }

    func loadButtons() {
        var buttonTitles = [String]()
        if let urlForAlphabet = Bundle.main.url(forResource: "alphabet", withExtension: "txt"){
            if let contentsOfAlphabet = try? String(contentsOf: urlForAlphabet){
                buttonTitles = contentsOfAlphabet.components(separatedBy: "\n")
           }
        }
        DispatchQueue.main.async {
            [weak self] in
        
            if buttonTitles.count == self?.letterButtons.count {
            for i in 0 ..< self!.letterButtons.count {
                self?.letterButtons[i].setTitle(buttonTitles[i], for: .normal)
                self?.letterButtons[i].setTitleColor(UIColor.green, for: .normal)
                //hiding unused buttons
                self?.letterButtons[26].isHidden = true
                self?.letterButtons[27].isHidden = true
                for button in self!.letterButtons{
                    button.backgroundColor = .red
                    button.layer.borderColor = UIColor.yellow.cgColor
                    button.layer.borderWidth = 5
                    button.layer.cornerRadius = button.frame.size.height/1.7
                    }
                }
            }
        }
    }
    
    @objc func info(){
        let ac = UIAlertController(title: "Info", message: "Hello! This a hangman type game, you have 7 lifes for each level, use hint to guess the word. In Scoreboard you can find all your high scores. Good luck and may the Ripley be with you", preferredStyle: .alert)
        //correct y position!
       let imageView = UIImageView(frame: CGRect(x: 0, y: -200, width: 270, height: 200))
        imageView.image = UIImage(named: "logo")
        ac.view.addSubview(imageView)
        ac.addAction(UIAlertAction(title: "OK", style: .destructive))
        ac.view.backgroundColor = .green
        present(ac, animated: true)
    }
    
    @objc func tapButton(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {return}
        tappedLetters = ""
        usedLetters.append(buttonTitle)
            for letter in mysteryWord {
                let strLetter = String(letter)
                if usedLetters.contains(strLetter) {
                    tappedLetters += strLetter
                } else {
                    tappedLetters += "?"
                }
            }
        
        if tappedLetters == mysteryWord  {
            score = (mysteryWord.count - usedLifes) + tmpScore
            tmpScore = score
            if level == 13 {
                win()
            } else {
                let ac = UIAlertController(title: "WIN", message: "Are you ready for the next level", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "NEXT", style: .default, handler: nextLevel))
                present(ac,animated: true)
                ac.view.backgroundColor = .green
                }
            }
        
        if !mysteryWord.contains(buttonTitle){
            lifes -= 1
            usedLifes += 1
            index += 1
            }
        
        if lifes == 0 {
            gameOver()
            }
        
        mysteryWordLabel.text = tappedLetters
        sender.isHidden = true
    }
    
    func win() {
        if score > tmpHighscore {
            let date = Date.getCurrentDate()
            scoresDictionary[date] = score
            tmpHighscore = score
            saveData()
    
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let highViewController = mainStoryboard.instantiateViewController(withIdentifier: "HighScore") as? HighScoreViewController {
            highViewController.highscore = tmpHighscore
            navigationController?.pushViewController(highViewController, animated: true)}
            } else {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                if let winViewController = mainStoryboard.instantiateViewController(withIdentifier: "Win") as? WinViewController {
                    winViewController.currentScore = score
                    navigationController?.pushViewController(winViewController, animated: true)}
                }
        newGame()
    }
    
    func gameOver() {
        if score > tmpHighscore {
            let date = Date.getCurrentDate()
            scoresDictionary[date] = score
            tmpHighscore = score
            saveData()
        }
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let gameOverViewController = mainStoryboard.instantiateViewController(withIdentifier: "GameOver") as? GameOverViewController {
            gameOverViewController.word = mysteryWord
            gameOverViewController.score = score
            navigationController?.pushViewController(gameOverViewController, animated: true)}
        newGame()
    }
    
    @objc func newGame() {
        level = 1
        index = 0
        loadLevel()
        loadButtons()
        score = 0
        tmpScore = 0
    }
    
    @objc func nextLevel(action: UIAlertAction) {
        level += 1
        index = 0
    loadLevel()
    loadButtons()
        score = tmpScore
    }
    
    @objc func scoreBoard(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let scoreboardViewController = mainStoryboard.instantiateViewController(withIdentifier: "ScoreBoard") as? ScoresViewControllerTableViewController {
            scoreboardViewController.scoreboardDict = scoresDictionary
            navigationController?.pushViewController(scoreboardViewController, animated: true)}
    }
    
    func saveData () {
            let defaults = UserDefaults.standard
            defaults.set(scoresDictionary, forKey: "scoresDictionary")
            defaults.set(tmpHighscore, forKey: "tmpHighscore")
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        if let savedDict = defaults.object(forKey: "scoresDictionary") as? [String: Int] {
            scoresDictionary = savedDict
        }
        if let savedHighscore = defaults.object(forKey: "tmpHighscore") as? Int {
            tmpHighscore = savedHighscore
        }
    }
    
}













