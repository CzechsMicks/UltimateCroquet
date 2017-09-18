//
//  Level4.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/30/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//



import SpriteKit
import GameplayKit

class Level4: SKScene, SKPhysicsContactDelegate {
    
    fileprivate var _player: CroquetGame = CroquetGame.sharedInstance
    
    private var lastUpdateTime : TimeInterval = 0
    private var _golfBall: SKSpriteNode?
    private var _arrowNode: SKSpriteNode?
    private var _empty1: SKSpriteNode?
    private var _empty2: SKSpriteNode?
    private var _empty3: SKSpriteNode?
    private var _stake: SKSpriteNode?
    private var _wheel1: SKReferenceNode?
    private var _wheel2: SKReferenceNode?
    private var _block1: SKReferenceNode?
    private var _block2: SKReferenceNode?
    private var _block3: SKReferenceNode?
    private var _block4: SKReferenceNode?
    private var _wicket1: SKReferenceNode?
    private var _wicket2: SKReferenceNode?
    private var _wicket3: SKReferenceNode?
    private var one: Bool = false
    var _power: CGFloat = 90
    private var leftTouch: Bool = false
    private var rightTouch: Bool = false
    private var tileBackground: SKTileMapNode!
    private var queueEmpty: [SKSpriteNode] = []
    private var queueWicket: [SKReferenceNode] = []
    var ballType: String = "redBall2"
    var _ambientColor:UIColor?
    private var block1Up: Bool = false
    private var block2Up: Bool = false
    private var block3Up: Bool = false
    private var block4Up: Bool = false
    
    
    var leftArrowButton: UIButton?
    weak var viewController: GameViewController4!
    
    
    override func sceneDidLoad() {
        setBallString(_player.currentBall())
        loadSceneNodes()
        physicsBody = SKPhysicsBody(edgeLoopFrom: tileBackground.frame)
    }
    
    func loadSceneNodes() {
        
        guard let golfBall = childNode(withName: "golfBall") as? SKSpriteNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _golfBall = golfBall
        _golfBall?.texture = SKTexture(image: UIImage(named: ballType)!)
        
        if(ballType == "beachBall"){
            physicsWorld.speed = 0.5
            _golfBall?.physicsBody?.mass = 0.02585
        }
        if(ballType == "pokeball"){
            let path = Bundle.main.path(forResource: "Pikachu", ofType: "sks")
            let rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
            
            rainParticle.position = CGPoint(x: (self.size.width)/2, y: (self.size.height))
            rainParticle.name = "rainParticle"
            rainParticle.targetNode = self
            
            self.addChild(rainParticle)
        }
        if(ballType == "vinyl"){
            physicsWorld.speed = 1.5
        }
        if(ballType == "spotifyIcon"){
            let path = Bundle.main.path(forResource: "notes", ofType: "sks")
            let rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
            
            rainParticle.position = CGPoint(x: (self.size.width)/2, y: (self.size.height))
            rainParticle.name = "rainParticle"
            rainParticle.targetNode = self
            
            self.addChild(rainParticle)
        }
        
        guard let arrowNode = childNode(withName: "arrow") as? SKSpriteNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _arrowNode = arrowNode
        
        guard let tileBackground = childNode(withName: "tileBackground")
            as? SKTileMapNode else {
                fatalError("Background node not loaded")
        }
        self.tileBackground = tileBackground
        
        guard let wicket1 = childNode(withName: "wicket1") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _wicket1 = wicket1
        
        guard let wicket2 = childNode(withName: "wicket2") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _wicket2 = wicket2
        
        guard let wicket3 = childNode(withName: "wicket3") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _wicket3 = wicket3
        
        guard let empty1 = childNode(withName: "empty1") as? SKSpriteNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _empty1 = empty1
        
        guard let empty2 = childNode(withName: "empty2") as? SKSpriteNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _empty2 = empty2
        
        guard let empty3 = childNode(withName: "empty3") as? SKSpriteNode else {
            fatalError("Sprite Nodes not loaded")
        }
        
        _empty3 = empty3
        
        guard let stake = childNode(withName: "stake") as? SKSpriteNode else {
            fatalError("Sprite Nodes not loaded")
        }
        _stake = stake
        
        guard let wheel1 = childNode(withName: "wheel1") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        _wheel1 = wheel1
        
        guard let wheel2 = childNode(withName: "wheel2") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        _wheel2 = wheel2
        
        guard let block1 = childNode(withName: "block1") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        _block1 = block1
        
        guard let block2 = childNode(withName: "block2") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        _block2 = block2
        
        guard let block3 = childNode(withName: "block3") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        _block3 = block3
        
        guard let block4 = childNode(withName: "block4") as? SKReferenceNode else {
            fatalError("Sprite Nodes not loaded")
        }
        _block4 = block4
        
        if(ballType == "discoBall"){
            _ambientColor = UIColor.darkGray
            let light = SKLightNode();
            light.position = CGPoint(x: 0, y: 0)
            light.falloff = 1
            light.ambientColor = _ambientColor!
            light.lightColor = UIColor.white
            
            _block2?.addChild(light)
        }
        
        _wicket2?.alpha = 0.25
        _wicket3?.alpha = 0.25
        
        if(queueEmpty.count == 0){
            queueEmpty.append(_empty1!)
            queueEmpty.append(_empty2!)
            queueEmpty.append(_empty3!)
            queueEmpty.append(_stake!)
            queueWicket.append(_wicket1!)
            queueWicket.append(_wicket2!)
            queueWicket.append(_wicket3!)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func increaseAngle(){
        _arrowNode?.zRotation -= 0.05
    }
    
    func decreaseAngle(){
        _arrowNode?.zRotation += 0.05
    }
    
    func swing(){
        viewController.incrementStroke()
        _arrowNode?.removeFromParent()
        let x = cos((_arrowNode?.zRotation)!) * _power
        let y = sin((_arrowNode?.zRotation)!) * _power
        _golfBall?.physicsBody?.applyImpulse(CGVector(dx: x, dy: y))
        
    }
    
    func ballResting() -> Bool {
        let ballVel = (_golfBall?.physicsBody?.velocity)!
        let ballAngVel = (_golfBall?.physicsBody?.angularVelocity)!
        if(ballAngVel < 0.5 && ballAngVel > -0.5 && ballVel.dy < 0.5 && ballVel.dy > -0.5 && ballVel.dx < 0.5 && ballVel.dx > -0.5){
            return true
        }else{
            return false
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        let ballResting = viewController.ballResting(golfBall: _golfBall!)
        
        _wheel1?.zRotation = (_wheel1?.zRotation)! + 0.2
        
        _wheel2?.zRotation = (_wheel2?.zRotation)! + 0.1
        
        if((_block1?.position.y)! > 225){
            //move down
            block1Up = false
        }
        if((_block1?.position.y)! < -260){
            //move up
            block1Up = true
        }
        
        if(block1Up){
            _block1?.position.y = (_block1?.position.y)! + 40
        }else{
            _block1?.position.y = (_block1?.position.y)! - 40
        }
        
        if((_block2?.position.y)! > 225){
            //move down
            block2Up = false
        }
        if((_block2?.position.y)! < -260){
            //move up
            block2Up = true
        }
        
        if(block2Up){
            _block2?.position.y = (_block2?.position.y)! + 40
        }else{
            _block2?.position.y = (_block2?.position.y)! - 40
        }
        
        if((_block3?.position.y)! > 225){
            //move down
            block3Up = false
        }
        if((_block3?.position.y)! < -260){
            //move up
            block3Up = true
        }
        
        if(block3Up){
            _block3?.position.y = (_block3?.position.y)! + 40
        }else{
            _block3?.position.y = (_block3?.position.y)! - 40
        }
        
        if((_block4?.position.y)! > 225){
            //move down
            block4Up = false
        }
        if((_block4?.position.y)! < -260){
            //move up
            block4Up = true
        }
        
        if(block4Up){
            _block4?.position.y = (_block4?.position.y)! + 60
        }else{
            _block4?.position.y = (_block4?.position.y)! - 60
        }
        
        if(!(viewController.leftArrowButton?.isHighlighted)!){
            rightTouch = false
        }
        if(!(viewController.rightArrowButton?.isHighlighted)!){
            leftTouch = false
        }
        
        if((_golfBall?.position.y)! < -775){
            camera?.position.y = -775
        }
        else if((_golfBall?.position.y)! > 776){
            camera?.position.y = 776
        }
        else{
            camera?.position.y = (_golfBall?.position.y)!
        }
        
        //        if((_golfBall?.position.x)! < -682){
        //            camera?.position.x = -682
        //        }
        if((_golfBall?.position.x)! < -(view?.frame.width)! * 0.94){
            camera?.position.x = -(view?.frame.width)! * 0.94
            
        }
        else if((_golfBall?.position.x)! > (view?.frame.width)! * 0.97){
            camera?.position.x = (view?.frame.width)! * 0.97
        }
        else{
            camera?.position.x = (_golfBall?.position.x)!
        }
        
        
        if((_golfBall?.physicsBody?.velocity.dx)! < CGFloat(8.0)
            && (_golfBall?.physicsBody?.velocity.dx)! > CGFloat(-8.0)
            && (_golfBall?.physicsBody?.velocity.dy)! < CGFloat(8.0)
            && (_golfBall?.physicsBody?.velocity.dy)! > CGFloat(-8.0)){
            _golfBall?.physicsBody?.velocity.dx = 0
            _golfBall?.physicsBody?.velocity.dy = 0
        }
        
        
        if(leftTouch){
            increaseAngle()
        }
        if(rightTouch){
            decreaseAngle()
        }
        
        if(ballResting){
            viewController.turnControlsOn()
            _arrowNode?.position = CGPoint(x: (_golfBall?.position.x)!, y: (_golfBall?.position.y)!)
            if(!children.contains(_arrowNode!)){
                addChild(_arrowNode!)
            }
            
        }else{
            viewController.turnControlsOff()
            if(_golfBall?.intersects(queueEmpty.first!))!{
                if(queueEmpty.first == _stake){
                    viewController._scene = nil
                    view?.presentScene(nil)
                    viewController.finishedLevel()
                }else{
                    queueWicket.first?.alpha = 0.25
                    queueEmpty.removeFirst()
                    queueWicket.removeFirst()
                    queueWicket.first?.alpha = 1
                }
                
            }
        }
        
    }
    
    func update(button: String) {
        if(button == "L"){
            _arrowNode?.zRotation += 0.001
            rightTouch = true
        }
        else if(button == "R"){
            _arrowNode?.zRotation -= 0.001
            leftTouch = true
        }
        else if(button == "S"){
            swing()
        }
        
    }
    
    //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify,
    //5: pandora, 6: vinyl, 7: youtube
    func setBallString(_ ball: Int){
        switch ball {
        case 0:
            ballType = "redBall2"
        case 1:
            ballType = "discoBall"
        case 2:
            ballType = "pokeball"
        case 3:
            ballType = "beachBall"
        case 4:
            ballType = "spotifyIcon"
        case 5:
            ballType = "pandoraIcon"
        case 6:
            ballType = "vinyl"
        case 7:
            ballType = "youtubeIcon"
        default:
            ballType = "redBall2"
        }
    }
}



