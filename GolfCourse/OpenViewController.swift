//
//  OpenViewController.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/6/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

import UIKit
import SpriteKit

class OpenViewController: UIViewController{
    
    fileprivate var _player: CroquetGame = CroquetGame.sharedInstance
    
    var _startButton: UIButton = UIButton()
    var _selectBallButton: UIButton = UIButton()
    var _selectLevelButton: UIButton = UIButton()
    var _scorecardButton: UIButton = UIButton()
    var _welcomeLabel: UILabel = UILabel()
    var _pressLabel: UILabel = UILabel()
    
    
    override func viewWillAppear(_ animated: Bool) {
        ///Genome functionality
        
        
//        _player.loginUser(email: _player.getEmail(), password: _player.getPassword(), completionHandler: {(success, error) -> () in
//            if (success) {
//                self._player.unlockedBall(4)
//                self._player.addUsersRecentlyPlayedTracks(){ (code)->Void in}
//            } else {
//                print("Error durring login " + error.debugDescription)
//            }
//            
//        })
    }
    
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
            
            let text: UIImage = UIImage(named: "logoWords")!
            let textImageView = UIImageView(image: text)
            textImageView.frame = CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.2, width: view.frame.width * 0.5, height: view.frame.height * 0.2)
            self.view.addSubview(textImageView)
            self.view.bringSubview(toFront: textImageView)
            
//            _welcomeLabel.text = "ULTIMATE CROQUET"
//            _welcomeLabel.textColor = UIColor.white
//            _welcomeLabel.frame = CGRect(x: view.frame.width / 2 - 75, y: view.frame.height / 2 - 100, width: 200, height: 100)
//            view.addSubview(_welcomeLabel)
            
//            _pressLabel.text = "Press Anywhere To Continue"
//            _pressLabel.textColor = UIColor.white
//            _pressLabel.frame = CGRect(x: view.frame.width / 2 - 175, y: view.frame.height / 2 - 50, width: 400, height: 100)
//            view.addSubview(_pressLabel)
            
            //start button
            _startButton.layer.cornerRadius = 10
            let playImage: UIImage = UIImage(named: "playButton")!
            _startButton.setImage(playImage, for: UIControlState.normal)
            _startButton.frame = CGRect(x: view.frame.width * 0.375, y: view.frame.height * 0.5, width: view.frame.width * 0.25, height: view.frame.height * 0.15)
            _startButton.addTarget(self, action: #selector(StartGame), for: UIControlEvents.touchDown)
            view.addSubview(_startButton)
            
            
            _selectBallButton.layer.cornerRadius = 10
            let selectBallImage: UIImage = UIImage(named: "selectBall")!
            _selectBallButton.setImage(selectBallImage, for: UIControlState.normal)
            //_selectBallButton.setTitle("Select Ball", for: UIControlState())
            _selectBallButton.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.15) / 2, y: view.frame.height * 0.7, width: view.frame.width * 0.15, height: view.frame.height * 0.05)
            _selectBallButton.addTarget(self, action: #selector(selectBall), for: UIControlEvents.touchDown)
            view.addSubview(_selectBallButton)
            
            _selectLevelButton.layer.cornerRadius = 10
            let selectLevelImage: UIImage = UIImage(named: "selectLevel")!
            _selectLevelButton.setImage(selectLevelImage, for: UIControlState.normal)
            //_selectLevelButton.setTitle("Select Level", for: UIControlState())
            _selectLevelButton.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.15) / 2, y: view.frame.height * 0.8, width: view.frame.width * 0.15, height: view.frame.height * 0.05)
            _selectLevelButton.addTarget(self, action: #selector(selectLevel), for: UIControlEvents.touchDown)
            view.addSubview(_selectLevelButton)
            
            
            _scorecardButton.layer.cornerRadius = 10
            let scorecardImage: UIImage = UIImage(named: "scorecard")!
            _scorecardButton.setImage(scorecardImage, for: UIControlState.normal)
            //_selectLevelButton.setTitle("Select Level", for: UIControlState())
            _scorecardButton.frame = CGRect(x: view.frame.maxX * 0.8, y: view.frame.maxY * 0.04, width: view.frame.width * 0.15, height: view.frame.height * 0.05)
            _scorecardButton.addTarget(self, action: #selector(scorecard), for: UIControlEvents.touchDown)
            view.addSubview(_scorecardButton)
        }
        
        
    }
    
    func StartGame(){
        navigationController?.pushViewController(GameViewController(), animated: false)
    }
    
    func selectBall(){
        navigationController?.pushViewController(BallSelectController(), animated: false)
    }
    
    func selectLevel(){
        navigationController?.pushViewController(LevelSelectController(), animated: false)
    }
    
    func scorecard(){
        navigationController?.pushViewController(ScorecardController(), animated: false)
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        present(GameViewController(), animated: false, completion: nil)
//    }

    
}
