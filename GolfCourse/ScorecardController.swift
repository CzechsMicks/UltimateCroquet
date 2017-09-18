//
//  ScorecardController.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/25/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

import UIKit
import SpriteKit

class ScorecardController: UIViewController{
    
    fileprivate var _player: CroquetGame = CroquetGame.sharedInstance
    
    var _continueButton: UIButton = UIButton()
    var _menuButton: UIButton?
    var _levelOne: UILabel = UILabel()
    var _levelTwo: UILabel = UILabel()
    var _levelThree: UILabel = UILabel()
    var _levelFour: UILabel = UILabel()
    var _pressLabel: UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view = SKView(frame: view.frame)
        
        if let view = self.view as! SKView? {
            let bg: UIImage = UIImage(named: "backgroundMain")!
            let newImageView = UIImageView(image: bg)
            newImageView.frame = self.view.bounds
            self.view.addSubview(newImageView)
            self.view.bringSubview(toFront: newImageView)
            
            let text: UIImage = UIImage(named: "scorecard")!
            let textImageView = UIImageView(image: text)
            textImageView.frame = CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.05, width: view.frame.width * 0.5, height: view.frame.height * 0.2)
            self.view.addSubview(textImageView)
            self.view.bringSubview(toFront: textImageView)
            
            //menu button
            _menuButton = UIButton()
            _menuButton?.setTitle("Menu", for: UIControlState())
            _menuButton?.layer.cornerRadius = 10
            _menuButton?.frame = CGRect(x: view.frame.maxX * 0.04, y: view.frame.maxY * 0.04, width: view.frame.maxX * 0.1, height: view.frame.maxY * 0.1)
            _menuButton?.addTarget(self, action: #selector(mainMenu), for: UIControlEvents.touchUpInside)
            view.addSubview(_menuButton!)
            
            let level1Score = _player.getScore(0)
            var level1String: String = "\(_player.getScore(0))"
            if(level1Score < 0){
                level1String = "N/A"
            }
            
            _levelOne.text = "Level 1 Best Score: \(level1String)"
            _levelOne.textColor = UIColor.white
            _levelOne.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.25) / 2, y: view.frame.height * 0.3, width: view.frame.width * 0.25, height: view.frame.height * 0.05)
            view.addSubview(_levelOne)
            
            let level2Score = _player.getScore(1)
            var level2String: String = "\(_player.getScore(1))"
            if(level2Score < 0){
                level2String = "N/A"
            }
            
            _levelTwo.text = "Level 2 Best Score: \(level2String)"
            _levelTwo.textColor = UIColor.white
            _levelTwo.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.25) / 2, y: view.frame.height * 0.4, width: view.frame.width * 0.25, height: view.frame.height * 0.05)
            view.addSubview(_levelTwo)
            
            let level3Score = _player.getScore(2)
            var level3String: String = "\(_player.getScore(2))"
            if(level3Score < 0){
                level3String = "N/A"
            }
            
            _levelThree.text = "Level 3 Best Score: \(level3String)"
            _levelThree.textColor = UIColor.white
            _levelThree.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.25) / 2, y: view.frame.height * 0.5, width: view.frame.width * 0.25, height: view.frame.height * 0.05)
            view.addSubview(_levelThree)
            
            let level4Score = _player.getScore(3)
            var level4String: String = "\(_player.getScore(3))"
            if(level4Score < 0){
                level4String = "N/A"
            }
            
            _levelFour.text = "Level 4 Best Score: \(level4String)"
            _levelFour.textColor = UIColor.white
            _levelFour.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.25) / 2, y: view.frame.height * 0.6, width: view.frame.width * 0.25, height: view.frame.height * 0.05)
            view.addSubview(_levelFour)
            
            _continueButton.layer.cornerRadius = 10
            let playImage: UIImage = UIImage(named: "continueButton")!
            _continueButton.setImage(playImage, for: UIControlState.normal)
            _continueButton.frame = CGRect(x: view.frame.width * 0.35, y: view.frame.height * 0.7, width: view.frame.width * 0.3, height: view.frame.height * 0.15)
            _continueButton.addTarget(self, action: #selector(Continue), for: UIControlEvents.touchUpInside)
            view.addSubview(_continueButton)
            
        }
        
        
    }
    
    func mainMenu(){
        navigationController?.popViewController(animated: false)
    }
    
    func Continue(){
        navigationController?.popViewController(animated: false)
    }
}

