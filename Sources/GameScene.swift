import Foundation
import SpriteKit

var star : SKSpriteNode!

public var savepoint = [SKShapeNode]()
var lastPosition: CGPoint!



public class GameScene: SKScene{
    let ball: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    var intouch = false
    let soundPlay = SKAudioNode(fileNamed: "shootingstar.mp3")

    
    public override func didMove(to view: SKView) {
        soundPlay.autoplayLooped = false
        self.addChild(soundPlay)
        
    
        
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        
        get {
            return true
        }
    }
    
    public func touchDown(atPoint pos : CGPoint) {
        

        lastPosition = pos
        let star = SKSpriteNode(color: UIColor.clear, size: self.size)
        let explosion = Explosion()
        explosion.explode (pos: pos, star: star, parent: self)
        scene?.run(SKAction.playSoundFileNamed("shootingstar.mp3", waitForCompletion: false))
        addChild(star)
        
    }
    
    public func touchMoved(toPoint pos : CGPoint) {
      
        let dx = pos.x - lastPosition.x
        let dy = pos.y - lastPosition.y
        
        if dx * dx + dy * dy < CGFloat(10000000) {
            let star = SKSpriteNode(color: UIColor.clear, size: self.size)
            let explosion = Explosion()
            explosion.explode (pos: pos, star: star, parent: self)
            scene?.run(SKAction.playSoundFileNamed("shootingstar.mp3", waitForCompletion: true))
            addChild(star)
            lastPosition = pos
            
            
        
            
        
            
        }
    }
    
    public func touchUp(atPoint pos : CGPoint) {
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchDown(atPoint: touches.first!.location(in: self))
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        
    }
}
