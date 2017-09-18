//
//  CroquetGame.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/19/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

//
//  BattleshipGames.swift
//  Battleship
//
//  Created by Jacob Osterloh on 3/10/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

import UIKit

class CroquetGame {
    private var _player = Player()
    let host = "http://35.165.224.147:60000/"
    
    var userToken: String?
    
    init() {
        _player._balls[0] = true
        _player._levels[0] = true
    }
    
    func getEmail() -> String{
        return _player._email
    }
    
    func getPassword() -> String{
        return _player._password
    }
    
    func setEmail(email: String){
        _player._email = email
        writeToFile()
    }
    
    func setPassword(password: String){
        _player._password = password
        writeToFile()
    }
    
    
    //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
    //5: pandora, 6: vinyl, 7: youtube
    func unlockedBall(_ index: Int){
        _player._balls[index] = true
        writeToFile()
    }
    
    func balls() -> [Bool]{
        return _player._balls
    }
    
    func currentBall() -> Int {
        return _player._currentBall
    }
    
    func setCurrentBall(_ ball: Int){
        _player._currentBall = ball
        writeToFile()
    }
    
    func unlockedLevel(_ index: Int){
        _player._levels[index] = true
        writeToFile()
    }
    
    func updateScore(_ level: Int, score: Int) {
        if(_player._levelScores[level] > score || _player._levelScores[level] < 0){
            _player._levelScores[level] = score
            writeToFile()
        }
    }
    
    func getScore(_ level: Int) -> Int{
        return _player._levelScores[level]
    }
    
    ///Functionality for Genome app

    
    
//    func loginUser(email: String, password: String, completionHandler: @escaping (Bool, Error?) -> Void) {
//        var request = URLRequest(url: URL(string: host + "genome/auth/connect")!)
//        request.httpMethod = "POST"
//        let postString = "{\"UserEmail\":\"" + email + "\", \"UserPassword\":\"" + password + "\", \"AppToken\":\"Ultimate Croquet\"}"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                //TODO: check for fundamental networking error
//                completionHandler(false, error)
//                return
//            }
//            
//            if let httpStatus = response as? HTTPURLResponse, (httpStatus.statusCode != 201) {
//                // check for http errors
//                print("login statusCode should be 200, but is \(httpStatus.statusCode)")
//                completionHandler(false, error)
//                return
//            }
//            
//            do{ // Parse Json Object and Get User Token
//                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
//                    if let token = json["UserToken"] as? String {
//                        self.userToken = token
//                        completionHandler(true, nil)
//                        return
//                    }
//                }
//            }catch{
//                print("Unable to parse json object durring login")
//            }
//            completionHandler(false, error)
//            return
//        }
//        task.resume()
//    }
//    
//    
//    
//    func addUsersRecentlyPlayedTracks(completionHandler: @escaping (Int) -> Void) {
//        var request = URLRequest(url: URL(string: host + "genome/music/recentlyPlayedTracks")!)
//        request.httpMethod = "POST"
//        let postString = "{\"UserToken\":\"" + (self.userToken)! + "\" , \"AppToken\":\"Ultimate Croquet\"}"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                //TODO: check for fundamental networking error
//                return
//            }
//            
//            if let httpStatus = response as? HTTPURLResponse, (httpStatus.statusCode != 200) {
//                // check for http errors
//                print("recentlyPlayedTracks statusCode should be 200, but is \(httpStatus.statusCode)")
//                if(httpStatus.statusCode == 401){
//                    completionHandler(httpStatus.statusCode)
//                }
//                return
//            }
//            
//            do{ // Parse Json Object and Get User Token
//                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
//                    if let trackList = json["Tracks"] as? [[String: String]]{
//                        for index in 1..<8{
//                            self._player._balls[index] = false
//                        }
//                        self.unlockedBall(0)
//                        self.unlockedBall(4)
//                        for index in 0..<2 { //most 2 recent
//                            let title = trackList[index]["Title"]
//                            let artist = trackList[index]["Artist"]
//                            let album = trackList[index]["Album"]
//                            let dateString = trackList[index]["DatePlayed"]
//                            
//                            let dateFormatter = DateFormatter()
//                            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
//                            
//                            let date = dateFormatter.date(from: dateString!)
//                            
//                            
//                            //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
//                            //5: pandora, 6: vinyl, 7: youtube
//                            ///update valid balls based on data.
//                            if(title == "Stayin' Alive"){
//                                self.unlockedBall(1)
//                            }
//                            if(title?.contains("Live"))!{
//                                self.unlockedBall(3)
//                            }
//                            if(title?.contains("Remix"))!{
//                                self.unlockedBall(6)
//                            }
//                            if(title == "Pokemon Theme"){
//                                self.unlockedBall(2)
//                            }
//                        }
//                    }
//                }
//            }catch{
//                print("Unable to parse json object durring recently played")
//            }
//            completionHandler(200)
//        }
//        task.resume()
//    }

    
    func writeToFile(){
        let documentsDirectory: NSString? = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString?
        
        let filePath: String? = (documentsDirectory as NSString?)!.appendingPathComponent("file.txt")
        
        writeToFile(filePath!)
    }
    
    func writeToFile(_ path: String) {
        let game: NSMutableArray = []
        
        let levels: NSArray = NSArray(array: _player._levels)
        let levelScores: NSArray = NSArray(array: _player._levelScores)
        let balls: NSArray = NSArray(array: _player._balls)
        let currentBall: Int = _player._currentBall
        let email: String = _player._email
        let password: String = _player._password
            
        let playerAsDictonary: NSDictionary = ["levels": levels, "levelScores": levelScores, "balls": balls, "currentBall": currentBall, "email": email, "password": password]
            
        game.add(playerAsDictonary)
        
        
        game.write(toFile: path, atomically: true)
    }
    
    class var sharedInstance: CroquetGame {
        struct Static {
            static var instance: CroquetGame?
        }
        if(Static.instance == nil){
            Static.instance = CroquetGame()
            
            let dir: NSString? = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString?
            
            let filePath: String? = (dir as NSString?)!.appendingPathComponent("file.txt")
            
            //make an NSArray from the file path
            let savedArray: NSArray? = NSArray(contentsOfFile: filePath!)
            
            if(savedArray != nil){
                let array = savedArray as! [NSDictionary]
                
                //setup all the battleship games in the collection
                for game in array
                {
                    let setUpPlayer: Player = Player()
                    let levels: [Bool] = game.value(forKey: "levels") as! [Bool]
                    for (index, element) in levels.enumerated() {
                        setUpPlayer._levels[index] = element
                    }
                    
                    let levelScores: [Int] = game.value(forKey: "levelScores") as! [Int]
                    for (index, element) in levelScores.enumerated() {
                        setUpPlayer._levelScores[index] = element
                    }
                    
                    let balls: [Bool] = game.value(forKey: "balls") as! [Bool]
                    for (index, element) in balls.enumerated() {
                        setUpPlayer._balls[index] = element
                    }

                    let currentBall: Int = (game.value(forKey: "currentBall")! as AnyObject).intValue
                    setUpPlayer._currentBall = currentBall
                    
                    let email: String = (game.value(forKey: "email")! as AnyObject).description
                    setUpPlayer._email = email
                    
                    let password: String = (game.value(forKey: "password")! as AnyObject).description
                    setUpPlayer._password = password

                    Static.instance?._player = setUpPlayer
                }
            }
        }
        return Static.instance!
    }
    
    
}

