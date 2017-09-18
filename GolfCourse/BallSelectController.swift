//
//  BallSelectController.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/19/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

import UIKit
import SpriteKit

class BallSelectController: UIViewController{
    
    fileprivate var _player: CroquetGame = CroquetGame.sharedInstance
    
    var _discoButton: UIButton = UIButton()
    var _pokeButton: UIButton = UIButton()
    var _beachButton: UIButton = UIButton()
    var _spotifyButton: UIButton = UIButton()
    var _pandoraButton: UIButton = UIButton()
    var _youtubeButton: UIButton = UIButton()
    var _redBallButton: UIButton = UIButton()
    var _vinylButton: UIButton = UIButton()
    var _menuButton: UIButton?
    var _genomeButton: UIButton?
    var _continueButton: UIButton?
    var _previousButton: UIButton?
    //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
    //5: pandora, 6: vinyl, 7: youtube
    var _selectedBall: Int = 0
    var _fromHomeScreen: Bool = true
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(!_fromHomeScreen){
            let vcCount: Int = (navigationController?.viewControllers.count)!
            navigationController?.viewControllers.remove(at: vcCount-2)
        }
        
        //make all balls available
//        for index in 1..<8{
//            _player.unlockedBall(index)
//        }
        
        navigationController?.isNavigationBarHidden = true
        view = SKView(frame: view.frame)
        
        if let view = self.view as! SKView? {
            let bg: UIImage = UIImage(named: "backgroundMain")!
            let newImageView = UIImageView(image: bg)
            newImageView.frame = self.view.bounds
            self.view.addSubview(newImageView)
            self.view.bringSubview(toFront: newImageView)
            
            //menu button
            _genomeButton = UIButton()
            _genomeButton?.setTitle("Link Genome", for: UIControlState())
            _genomeButton?.layer.cornerRadius = 10
            _genomeButton?.frame = CGRect(x: view.frame.maxX * 0.8, y: view.frame.maxY * 0.04, width: view.frame.maxX * 0.15, height: view.frame.maxY * 0.1)

            _genomeButton?.addTarget(self, action: #selector(linkGenome), for: UIControlEvents.touchDown)
            view.addSubview(_genomeButton!)
            
            //menu button
            _menuButton = UIButton()
            _menuButton?.setTitle("Menu", for: UIControlState())
            _menuButton?.layer.cornerRadius = 10
            _menuButton?.frame = CGRect(x: view.frame.maxX * 0.04, y: view.frame.maxY * 0.04, width: view.frame.maxX * 0.1, height: view.frame.maxY * 0.1)
            _menuButton?.addTarget(self, action: #selector(mainMenu), for: UIControlEvents.touchDown)
            view.addSubview(_menuButton!)
            
            //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
            //5: pandora, 6: vinyl, 7: youtube
            
            _pokeButton = UIButton()
            _pokeButton.layer.cornerRadius = 10
            _pokeButton.frame = CGRect(x: view.frame.maxX * 0.025, y: view.frame.height * 0.15, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let pokeImage: UIImage = UIImage(named: "pokeball")!
            _pokeButton.setImage(pokeImage, for: UIControlState.normal)
            _pokeButton.addTarget(self, action: #selector(pokeballSelected), for: UIControlEvents.touchDown)
            if(_player.balls()[2] == false){
                _pokeButton.alpha = 0.25
            }
            view.addSubview(_pokeButton)
            
            _discoButton = UIButton()
            _discoButton.layer.cornerRadius = 10
            _discoButton.frame = CGRect(x: view.frame.maxX * 0.275, y: view.frame.height * 0.15, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let discoImage: UIImage = UIImage(named: "discoBall")!
            _discoButton.setImage(discoImage, for: UIControlState.normal)
            _discoButton.addTarget(self, action: #selector(discoBallSelected), for: UIControlEvents.touchDown)
            if(_player.balls()[1] == false){
                _discoButton.alpha = 0.25
            }
            view.addSubview(_discoButton)
            
            _vinylButton = UIButton()
            _vinylButton.layer.cornerRadius = 10
            _vinylButton.frame = CGRect(x: view.frame.maxX * 0.525, y: view.frame.height * 0.15, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let vinylImage: UIImage = UIImage(named: "vinyl")!
            _vinylButton.setImage(vinylImage, for: UIControlState.normal)
            _vinylButton.addTarget(self, action: #selector(vinylBallSelected), for: UIControlEvents.touchDown)
            if(_player.balls()[6] == false){
                _vinylButton.alpha = 0.25
            }
            view.addSubview(_vinylButton)
            
            _beachButton = UIButton()
            _beachButton.layer.cornerRadius = 10
            _beachButton.frame = CGRect(x: view.frame.maxX * 0.775, y: view.frame.height * 0.15, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let beachImage: UIImage = UIImage(named: "beachBall")!
            _beachButton.setImage(beachImage, for: UIControlState.normal)
            _beachButton.addTarget(self, action: #selector(beachBallSelected), for: UIControlEvents.touchDown)
            if(_player.balls()[3] == false){
                _beachButton.alpha = 0.25
            }
            view.addSubview(_beachButton)
            
            _spotifyButton = UIButton()
            _spotifyButton.layer.cornerRadius = 10
            _spotifyButton.frame = CGRect(x: view.frame.maxX * 0.025, y: view.frame.height * 0.45, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let spotifyImage: UIImage = UIImage(named: "spotifyIcon")!
            _spotifyButton.setImage(spotifyImage, for: UIControlState.normal)
            _spotifyButton.addTarget(self, action: #selector(spotifySelected), for: UIControlEvents.touchDown)
            if(_player.balls()[4] == false){
                _spotifyButton.alpha = 0.25
            }
            view.addSubview(_spotifyButton)
            
            _pandoraButton = UIButton()
            _pandoraButton.layer.cornerRadius = 10
            _pandoraButton.frame = CGRect(x: view.frame.maxX * 0.275, y: view.frame.height * 0.45, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let pandoraImage: UIImage = UIImage(named: "pandoraIcon")!
            _pandoraButton.setImage(pandoraImage, for: UIControlState.normal)
            _pandoraButton.addTarget(self, action: #selector(pandoraSelected), for: UIControlEvents.touchDown)
            if(_player.balls()[5] == false){
                _pandoraButton.alpha = 0.25
            }
            view.addSubview(_pandoraButton)
            
            _youtubeButton = UIButton()
            _youtubeButton.layer.cornerRadius = 10
            _youtubeButton.frame = CGRect(x: view.frame.maxX * 0.525, y: view.frame.height * 0.45, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let youtubeImage: UIImage = UIImage(named: "youtubeIcon")!
            _youtubeButton.setImage(youtubeImage, for: UIControlState.normal)
            _youtubeButton.addTarget(self, action: #selector(youtubeSelected), for: UIControlEvents.touchDown)
            if(_player.balls()[7] == false){
                _youtubeButton.alpha = 0.25
            }
            view.addSubview(_youtubeButton)
            
            _redBallButton = UIButton()
            _redBallButton.layer.cornerRadius = 10
            _redBallButton.frame = CGRect(x: view.frame.maxX * 0.775, y: view.frame.height * 0.45, width: view.frame.width * 0.15, height: view.frame.width * 0.15)
            let redBallImage: UIImage = UIImage(named: "redBall2")!
            _redBallButton.setImage(redBallImage, for: UIControlState.normal)
            _redBallButton.addTarget(self, action: #selector(redBallSelected), for: UIControlEvents.touchDown)
            view.addSubview(_redBallButton)
            
            _continueButton = UIButton()
            _continueButton?.layer.cornerRadius = 10
            let playImage: UIImage = UIImage(named: "continueButton")!
            _continueButton?.setImage(playImage, for: UIControlState.normal)
            _continueButton?.frame = CGRect(x: view.frame.width * 0.375, y: view.frame.height * 0.8, width: view.frame.width * 0.3, height: view.frame.height * 0.15)
            _continueButton?.addTarget(self, action: #selector(Continue), for: UIControlEvents.touchUpInside)
            view.addSubview(_continueButton!)
            
            setBallSelection(_player.currentBall())
        }
        
        
    }
    
    func buttons(){
        //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
        //5: pandora, 6: vinyl, 7: youtube
        
        
        if(_player.balls()[2] == false){
            DispatchQueue.main.async {
                self._pokeButton.alpha = 0.25
                self._pokeButton.setNeedsDisplay()
            }
        }else{
            DispatchQueue.main.async {
                self._pokeButton.alpha = 1
                self._pokeButton.setNeedsDisplay()
            }
        }
        if(_player.balls()[1] == false){
            DispatchQueue.main.async {
                self._discoButton.alpha = 0.25
                self._discoButton.setNeedsDisplay()
            }
        }else{
            DispatchQueue.main.async {
                self._discoButton.alpha = 1
                self._discoButton.setNeedsDisplay()
            }
        }
        if(_player.balls()[6] == false){
            DispatchQueue.main.async {
                self._vinylButton.alpha = 0.25
                self._vinylButton.setNeedsDisplay()
            }
        }else{
            DispatchQueue.main.async {
                self._vinylButton.alpha = 1
                self._vinylButton.setNeedsDisplay()
            }
        }
        if(_player.balls()[3] == false){
            DispatchQueue.main.async {
                self._beachButton.alpha = 0.25
                self._beachButton.setNeedsDisplay()
            }
        }else{
            DispatchQueue.main.async {
                self._beachButton.alpha = 1
                self._beachButton.setNeedsDisplay()
            }
        }
        if(_player.balls()[4] == false){
            DispatchQueue.main.async {
                self._spotifyButton.alpha = 0.25
                self._spotifyButton.setNeedsDisplay()
            }
        }else{
            DispatchQueue.main.async {
                self._spotifyButton.alpha = 1
                self._spotifyButton.setNeedsDisplay()
            }
        }
        if(_player.balls()[5] == false){
            DispatchQueue.main.async {
                self._pandoraButton.alpha = 0.25
                self._pandoraButton.setNeedsDisplay()
            }
        }else{
            DispatchQueue.main.async {
                self._pandoraButton.alpha = 1
                self._pandoraButton.setNeedsDisplay()
            }
        }
        if(_player.balls()[7] == false){
            DispatchQueue.main.async {
                self._youtubeButton.alpha = 0.25
                self._youtubeButton.setNeedsDisplay()
            }
        }else{
            DispatchQueue.main.async {
                self._youtubeButton.alpha = 1
                self._youtubeButton.setNeedsDisplay()
            }
        }

    }
    
    func mainMenu(){
        _player.setCurrentBall(_selectedBall)
        navigationController?.popViewController(animated: false)
    }
    
    func linkGenome(){
        _player.setCurrentBall(_selectedBall)
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Genome", message: "Enter Login Information", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (username) in
            username.placeholder = "username"
        }
        
        alert.addTextField { (password) in
            password.placeholder = "password"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Link Account", style: .default, handler: { [weak alert] (_) in
            let _email = alert?.textFields![0].text // Force unwrapping because we know it exists.
            let _pass = alert?.textFields![1].text
            
            /// Genome functionality
            
            self._player.loginUser(email: _email!, password: _pass!, completionHandler: {(success, error) -> () in
                if (success) {
                    self._player.setEmail(email: _email!)
                    self._player.setPassword(password: _pass!)
                    self._player.unlockedBall(4)
                    self._player.addUsersRecentlyPlayedTracks(){(statusCode) -> Void in
                        if(statusCode == 401){
                            let alert = UIAlertController(title: "Oops", message: "Looks like you denied this App some Genome permissions! Head back to Genome to grant us access so we can get the ball rollin'!", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        self.buttons()
                    }
                } else {
                    print("Error durring login " + error.debugDescription)
                }
                
            })
            
        }))

        alert.addAction(cancelAction)
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    func Continue(){
        _player.setCurrentBall(_selectedBall)
        let viewController = LevelSelectController()
        viewController._fromSelectBall = true
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
    //5: pandora, 6: vinyl, 7: youtube
    
    func pokeballSelected(){
        if(_pokeButton != _previousButton && _pokeButton.alpha > 0.5){
            deselectPreviousButton()
            selectButton(_pokeButton, ball: 2)
        }else if(_pokeButton.alpha < 0.5){
            let alert = UIAlertController(title: "Oops", message: "Listen to the Pokemon theme song to unlock the poke ball!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func discoBallSelected(){
        if(_discoButton != _previousButton && _discoButton.alpha > 0.5){
            deselectPreviousButton()
            selectButton(_discoButton, ball: 1)
        }else if(_discoButton.alpha < 0.5){
            let alert = UIAlertController(title: "Oops", message: "Listen to Stayin' Alive by the Beegees to unlock the disco ball!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func vinylBallSelected(){
        if(_vinylButton != _previousButton && _vinylButton.alpha > 0.5){
            deselectPreviousButton()
            selectButton(_vinylButton, ball: 6)
        }else if(_vinylButton.alpha < 0.5){
            let alert = UIAlertController(title: "Oops", message: "Listen to a remix to unlock the record ball!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func beachBallSelected(){
        if(_beachButton != _previousButton && _beachButton.alpha > 0.5){
            deselectPreviousButton()
            selectButton(_beachButton, ball: 3)
        }else if(_beachButton.alpha < 0.5){
            let alert = UIAlertController(title: "Oops", message: "Listen to more live music to unlock the beach ball!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func spotifySelected(){
        if(_spotifyButton != _previousButton && _spotifyButton.alpha > 0.5){
            deselectPreviousButton()
            selectButton(_spotifyButton, ball: 4)
        }else if(_spotifyButton.alpha < 0.5){
            let alert = UIAlertController(title: "Oops", message: "Sync your Spotify account with Genome to unlock the Spotify ball!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func pandoraSelected(){
        if(_pandoraButton != _previousButton && _pandoraButton.alpha > 0.5){
            deselectPreviousButton()
            selectButton(_pandoraButton, ball: 5)
        }else if(_pandoraButton.alpha < 0.5){
            let alert = UIAlertController(title: "Oops", message: "Sync your Pandora account with Genome to unlock the Pandora ball!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func youtubeSelected(){
        if(_youtubeButton != _previousButton && _youtubeButton.alpha > 0.5){
            deselectPreviousButton()
            selectButton(_youtubeButton, ball: 7)
        }else if(_youtubeButton.alpha < 0.5){
            let alert = UIAlertController(title: "Oops", message: "Sync your YouTubeMusic account with Genome to unlock the YouTube ball!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func redBallSelected(){
        if(_redBallButton != _previousButton){
            deselectPreviousButton()
            selectButton(_redBallButton, ball: 0)
        }
    }
    
    func deselectPreviousButton(){
        _previousButton?.isSelected = !(_previousButton?.isSelected)!
        _previousButton?.backgroundColor = UIColor.yellow.withAlphaComponent(0.0)
        _previousButton?.isSelected = false
    }
    
    func selectButton(_ button: UIButton, ball: Int){
        button.isSelected = !button.isSelected
        if(button.isSelected){
            button.backgroundColor = UIColor.yellow
        } else{
            button.backgroundColor = UIColor.yellow.withAlphaComponent(0.0)
        }
        _previousButton = button
        _selectedBall = ball
    }
    
    //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
    //5: pandora, 6: vinyl, 7: youtube
    func setBallSelection(_ ball: Int){
        switch ball {
        case 0:
            redBallSelected()
        case 1:
            discoBallSelected()
        case 2:
            pokeballSelected()
        case 3:
            beachBallSelected()
        case 4:
            spotifySelected()
        case 5:
            pandoraSelected()
        case 6:
            vinylBallSelected()
        case 7:
            youtubeSelected()
        default:
            redBallSelected()
        }
    }
    //    func StartGame(){
    //        //navigationController?.pushViewController(GameViewController(), animated: false)
    //        present(GameViewController(), animated: false, completion: nil)
    //    }
    
}

