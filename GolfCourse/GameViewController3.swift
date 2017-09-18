//
//  GameViewController3.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/30/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//


import UIKit
import SpriteKit
import GameplayKit


class GameViewController3: UIViewController {
    
    fileprivate var _player: CroquetGame = CroquetGame.sharedInstance
    
    var currentGame: Level3?
    var leftArrowButton: UIButton?
    var rightArrowButton: UIButton?
    var _menuButton: UIButton?
    var shootButton: UIButton?
    var powerSlider: UISlider?
    var strokeLabel: UILabel?
    var strokeCount: Int = 0
    var currentLevel: Int = 3
    var _level: String = "Level3"
    var _scene: SKScene?
    
    override func viewDidAppear(_ animated: Bool) {
        if(_scene == nil){
            navigationController?.popViewController(animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vcCount: Int = (navigationController?.viewControllers.count)!
        navigationController?.viewControllers.remove(at: vcCount-2)
        view = SKView(frame: view.frame)
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            //TODO: LOAD SCENE DEPENDING ON CURRENT LEVEL
            if let scene = Level3(fileNamed: _level) {
                _scene = scene
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                currentGame = scene
                currentGame?.viewController = self
                
                // Present the scene
                view.presentScene(scene)
            }
            
            leftArrowButton = UIButton()
            leftArrowButton?.frame = CGRect(x: view.frame.maxX * 0.01, y: view.frame.maxY * 0.72, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let leftImage: UIImage = UIImage(named: "greyArrowLeft")!
            leftArrowButton?.setImage(leftImage, for: UIControlState.normal)
            leftArrowButton?.addTarget(self, action: #selector(leftArrowPressed), for: UIControlEvents.touchDown)
            view.addSubview(leftArrowButton!)
            
            rightArrowButton = UIButton()
            rightArrowButton?.frame = CGRect(x: view.frame.maxX * 0.15, y: view.frame.maxY * 0.72, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let rightImage: UIImage = UIImage(named: "greyArrow")!
            rightArrowButton?.setImage(rightImage, for: UIControlState.normal)
            rightArrowButton?.addTarget(self, action: #selector(rightArrowPressed), for: UIControlEvents.touchDown)
            view.addSubview(rightArrowButton!)
            
            shootButton = UIButton()
            shootButton?.frame = CGRect(x: view.frame.maxX * 0.85, y: view.frame.maxY * 0.75, width: view.frame.width * 0.1, height: view.frame.width * 0.1)
            let shootImage: UIImage = UIImage(named: "Shoot")!
            shootButton?.setImage(shootImage, for: UIControlState.normal)
            shootButton?.addTarget(self, action: #selector(shootPressed), for: UIControlEvents.touchDown)
            view.addSubview(shootButton!)
            
            strokeLabel = UILabel()
            strokeLabel?.frame = CGRect(x: view.frame.maxX * 0.8, y: view.frame.maxY * 0.04, width: view.frame.maxX * 0.15, height: view.frame.maxY * 0.1)
            strokeLabel?.text = "Strokes: 0"
            view.addSubview(strokeLabel!)
            
            //menu button
            _menuButton = UIButton()
            _menuButton?.setTitle("Menu", for: UIControlState())
            _menuButton?.layer.cornerRadius = 10
            _menuButton?.frame = CGRect(x: view.frame.maxX * 0.04, y: view.frame.maxY * 0.04, width: view.frame.maxX * 0.1, height: view.frame.maxY * 0.1)
            _menuButton?.addTarget(self, action: #selector(mainMenu), for: UIControlEvents.touchDown)
            view.addSubview(_menuButton!)
            
            powerSlider = UISlider()
            powerSlider?.frame = CGRect(x: view.frame.maxX * 0.55, y: view.frame.maxY * 0.8, width: view.frame.width * 0.25, height: view.frame.width * 0.05)
            powerSlider?.tintColor = UIColor.red
            powerSlider?.maximumValue = 200
            powerSlider?.minimumValue = 20
            powerSlider?.value = 90
            powerSlider?.addTarget(self, action: #selector(powerChanged), for: UIControlEvents.valueChanged)
            view.addSubview(powerSlider!)
            
            view.ignoresSiblingOrder = true
            
//            view.showsFPS = true
//            view.showsNodeCount = true
        }
    }
    
    func turnControlsOff(){
        shootButton?.isUserInteractionEnabled = false
        rightArrowButton?.isUserInteractionEnabled = false
        leftArrowButton?.isUserInteractionEnabled = false
    }
    
    func turnControlsOn(){
        shootButton?.isUserInteractionEnabled = true
        rightArrowButton?.isUserInteractionEnabled = true
        leftArrowButton?.isUserInteractionEnabled = true
    }
    
    func powerChanged(){
        currentGame?._power = CGFloat((powerSlider?.value)!)
    }
    
    func shootPressed(){
        currentGame?.update(button: "S")
    }
    
    func leftArrowPressed(){
        currentGame?.update(button: "L")
    }
    
    func rightArrowPressed(){
        currentGame?.update(button: "R")
    }
    
    func incrementStroke(){
        strokeCount += 1
        strokeLabel?.text = "Strokes: \(strokeCount)"
    }
    
    func ballResting(golfBall: SKSpriteNode) -> Bool{
        let ballVel = (golfBall.physicsBody?.velocity)!
        let ballAngVel = (golfBall.physicsBody?.angularVelocity)!
        if(ballAngVel < 0.5 && ballAngVel > -0.5 && ballVel.dy < 0.5 && ballVel.dy > -0.5 && ballVel.dx < 0.5 && ballVel.dx > -0.5){
            return true
        }else{
            return false
        }
    }
    
    func finishedLevel(){
        _player.updateScore(2, score: strokeCount)
        let inbetween: InbetweenLevelsController = InbetweenLevelsController()
        inbetween.setScore(strokeCount, forLevel: currentLevel)
        navigationController?.pushViewController(inbetween, animated: false)
    }
    
    func mainMenu(){
        navigationController?.popViewController(animated: false)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


