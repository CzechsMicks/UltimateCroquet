//
//  LevelSelectController.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/23/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

import UIKit
import SpriteKit

class LevelSelectController: UIViewController{
    
    var _startButton: UIButton = UIButton()
    var _selectBallButton: UIButton = UIButton()
    var _levelOne: UIButton = UIButton()
    var _levelTwo: UIButton = UIButton()
    var _levelThree: UIButton = UIButton()
    var _levelFour: UIButton = UIButton()
    var _welcomeLabel: UILabel = UILabel()
    var _pressLabel: UILabel = UILabel()
    var _menuButton: UIButton?
    var _fromSelectBall: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(_fromSelectBall){
            let vcCount: Int = (navigationController?.viewControllers.count)!
            navigationController?.viewControllers.remove(at: vcCount-2)
        }
        navigationController?.isNavigationBarHidden = true
        view = SKView(frame: view.frame)
        
        if let view = self.view as! SKView? {
            let bg: UIImage = UIImage(named: "backgroundMain")!
            let newImageView = UIImageView(image: bg)
            newImageView.frame = self.view.bounds
            self.view.addSubview(newImageView)
            self.view.bringSubview(toFront: newImageView)
            
            //menu button
            _menuButton = UIButton()
            _menuButton?.setTitle("Menu", for: UIControlState())
            _menuButton?.layer.cornerRadius = 10
            _menuButton?.frame = CGRect(x: view.frame.maxX * 0.04, y: view.frame.maxY * 0.04, width: view.frame.maxX * 0.1, height: view.frame.maxY * 0.1)
            _menuButton?.addTarget(self, action: #selector(mainMenu), for: UIControlEvents.touchDown)
            view.addSubview(_menuButton!)
            
            _levelOne.layer.cornerRadius = 10
            let levelOneImage: UIImage = UIImage(named: "levelOne")!
            _levelOne.setImage(levelOneImage, for: UIControlState.normal)
            _levelOne.frame = CGRect(x: view.frame.maxX * 0.025, y: view.frame.height * 0.3, width: view.frame.width * 0.2, height: view.frame.height * 0.2)
            _levelOne.addTarget(self, action: #selector(level1), for: UIControlEvents.touchDown)
            view.addSubview(_levelOne)
            
            _levelTwo.layer.cornerRadius = 10
            let levelTwoImage: UIImage = UIImage(named: "levelTwo")!
            _levelTwo.setImage(levelTwoImage, for: UIControlState.normal)
            _levelTwo.frame = CGRect(x: view.frame.maxX * 0.275, y: view.frame.height * 0.3, width: view.frame.width * 0.2, height: view.frame.height * 0.2)
            _levelTwo.addTarget(self, action: #selector(level2), for: UIControlEvents.touchDown)
            view.addSubview(_levelTwo)
            
            _levelThree.layer.cornerRadius = 10
            let levelThreeImage: UIImage = UIImage(named: "levelThree")!
            _levelThree.setImage(levelThreeImage, for: UIControlState.normal)
            _levelThree.frame = CGRect(x: view.frame.maxX * 0.525, y: view.frame.height * 0.3, width: view.frame.width * 0.2, height: view.frame.height * 0.2)
            _levelThree.addTarget(self, action: #selector(level3), for: UIControlEvents.touchDown)
            view.addSubview(_levelThree)
            
            _levelFour.layer.cornerRadius = 10
            let levelFourImage: UIImage = UIImage(named: "levelFour")!
            _levelFour.setImage(levelFourImage, for: UIControlState.normal)
            _levelFour.frame = CGRect(x: view.frame.maxX * 0.775, y: view.frame.height * 0.3, width: view.frame.width * 0.2, height: view.frame.height * 0.2)
            _levelFour.addTarget(self, action: #selector(level4), for: UIControlEvents.touchDown)
            view.addSubview(_levelFour)
            
            //            _welcomeLabel.text = "ULTIMATE CROQUET"
            //            _welcomeLabel.textColor = UIColor.white
            //            _welcomeLabel.frame = CGRect(x: view.frame.width / 2 - 75, y: view.frame.height / 2 - 100, width: 200, height: 100)
            //            view.addSubview(_welcomeLabel)
            
            //            _pressLabel.text = "Press Anywhere To Continue"
            //            _pressLabel.textColor = UIColor.white
            //            _pressLabel.frame = CGRect(x: view.frame.width / 2 - 175, y: view.frame.height / 2 - 50, width: 400, height: 100)
            //            view.addSubview(_pressLabel)
            
            //start button
            
            
//            _startButton.layer.cornerRadius = 10
//            let playImage: UIImage = UIImage(named: "playButton")!
//            _startButton.setImage(playImage, for: UIControlState.normal)
//            _startButton.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2, width: 200, height: 60)
//            _startButton.addTarget(self, action: #selector(StartGame), for: UIControlEvents.touchDown)
//            view.addSubview(_startButton)
            
            
            _selectBallButton.layer.cornerRadius = 10
            let selectBallImage: UIImage = UIImage(named: "selectBall")!
            _selectBallButton.setImage(selectBallImage, for: UIControlState.normal)
            //_selectBallButton.setTitle("Select Ball", for: UIControlState())
            _selectBallButton.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.15) / 2, y: view.frame.height * 0.7, width: view.frame.width * 0.15, height: view.frame.height * 0.05)
            _selectBallButton.addTarget(self, action: #selector(selectBall), for: UIControlEvents.touchDown)
            view.addSubview(_selectBallButton)
            
            
        }
        
        
    }
//
//    func StartGame(){
//        navigationController?.pushViewController(GameViewController(), animated: false)
//    }
    func mainMenu(){
        navigationController?.popViewController(animated: false)
    }
    
    func level1(){
        let viewController = GameViewController()
        viewController.fromStartScreen(false)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    func level2(){
        navigationController?.pushViewController(GameViewController2(), animated: false)
    }
    func level3(){
        navigationController?.pushViewController(GameViewController3(), animated: false)
    }
    func level4(){
        navigationController?.pushViewController(GameViewController4(), animated: false)
    }
        
        
    func selectBall(){
        let viewController = BallSelectController()
        viewController._fromHomeScreen = false
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        present(GameViewController(), animated: false, completion: nil)
    //    }
    
    
}
