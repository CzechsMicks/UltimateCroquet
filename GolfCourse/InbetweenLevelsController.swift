//
//  InbetweenLevelsController.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/13/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

import UIKit
import SpriteKit

class InbetweenLevelsController: UIViewController{
    
    var _continueButton: UIButton = UIButton()
    var _menuButton: UIButton?
    var _levelLabel: UILabel = UILabel()
    var _scoreLabel: UILabel = UILabel()
    var _pressLabel: UILabel = UILabel()
    var _score: Int?
    var _level: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vcCount: Int = (navigationController?.viewControllers.count)!
        navigationController?.viewControllers.remove(at: vcCount-2)
        navigationController?.isNavigationBarHidden = true
        view = SKView(frame: view.frame)
        NSLog("\(view.frame)")
        
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
            _menuButton?.addTarget(self, action: #selector(mainMenu), for: UIControlEvents.touchUpInside)
            view.addSubview(_menuButton!)
            
            _levelLabel.text = "Level \(_level!) completed!"
            _levelLabel.textColor = UIColor.white
            _levelLabel.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.2) / 2, y: view.frame.height * 0.3, width: view.frame.width * 0.2, height: view.frame.height * 0.05)
            view.addSubview(_levelLabel)
            
            _scoreLabel.text = "Score: \(_score!)"
            _scoreLabel.textColor = UIColor.white
            _scoreLabel.frame = CGRect(x: view.frame.width * 0.5 - (view.frame.width * 0.1) / 2, y: view.frame.height * 0.4, width: view.frame.width * 0.1, height: view.frame.height * 0.05)
            view.addSubview(_scoreLabel)
            
            _continueButton.layer.cornerRadius = 10
            let playImage: UIImage = UIImage(named: "continueButton")!
            _continueButton.setImage(playImage, for: UIControlState.normal)
            _continueButton.frame = CGRect(x: view.frame.width * 0.35, y: view.frame.height * 0.5, width: view.frame.width * 0.3, height: view.frame.height * 0.15)
            _continueButton.addTarget(self, action: #selector(Continue), for: UIControlEvents.touchUpInside)
            view.addSubview(_continueButton)
            
        }
        
        
    }
    
    func setScore(_ score: Int, forLevel: Int){
        _score = score
        _level = forLevel
    }
    
    func mainMenu(){
        navigationController?.popViewController(animated: false)
    }
    
    func Continue(){
        if(_level == 1){
            let viewController = GameViewController2()
            navigationController?.pushViewController(viewController, animated: false)
        } else if(_level == 2){
            let viewController = GameViewController3()
            navigationController?.pushViewController(viewController, animated: false)
        }else if(_level == 3){
            let viewController = GameViewController4()
            navigationController?.pushViewController(viewController, animated: false)
        }else{
            navigationController?.popViewController(animated: false)
        }
        
        
    }
}
