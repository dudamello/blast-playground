import Foundation
import SpriteKit

var label1: SKLabelNode!
var label2: SKLabelNode!
var label3: SKLabelNode!
var label4: SKLabelNode!
var label5: SKLabelNode!

public class FirstScene: SKScene {
    var logo = SKSpriteNode(imageNamed: "logo")
    var home = true
    public override func didMove(to view: SKView) {
      logo.position = CGPoint(x: 2.269, y: 60.884)
        
        let fadeOut = SKAction.fadeAlpha(to: 0.3, duration: 1)
        let fadeIn = SKAction.fadeAlpha(to: 1, duration: 1)
        logo.run(SKAction.repeatForever(SKAction.sequence([fadeOut, fadeIn])))
        
        self.addChild(logo)
        
        label1 = SKLabelNode(fontNamed: "PingFangTC Ultralight ")
        label1.fontColor = .white
        label1.alpha = 1
        label2 = SKLabelNode(fontNamed: "PingFangTC Ultralight ")
        label2.fontColor = .white
        label2.alpha = 1
        label3 = SKLabelNode(fontNamed: "PingFangTC Ultralight ")
        label3.fontColor = .white
        label3.alpha = 1
        label4 = SKLabelNode(fontNamed: "PingFangTC Ultralight ")
        label4.fontColor = .white
        label4.alpha = 1
        label5 = SKLabelNode(fontNamed: "PingFangTC Ultralight ")
        label5.fontColor = .white
        label5.alpha = 1

        label1.position = CGPoint(x: -193, y: -100)
        label2.position = CGPoint(x: -97.738, y: -100)
        label3.position = CGPoint(x: 1.323, y: -100)
        label4.position = CGPoint(x: 96.058, y: -100)
        label5.position = CGPoint(x: 199, y: -100)

        label1.fontSize = 100
        label2.fontSize = 100
        label3.fontSize = 100
        label4.fontSize = 100
        label5.fontSize = 100

        label1.text = "B"
        label2.text = "L"
        label3.text = "A"
        label4.text = "S"
        label5.text = "T"
        
        addChild(label1)
        addChild(label2)
        addChild(label3)
        addChild(label4)
        addChild(label5)

    }
    //Fade Up Effect
    private func fadeUpAndRemove(node: SKNode, callback: @escaping () -> Void) {
        let fadeOutAction = SKAction.group([
            SKAction.fadeOut(withDuration: 2.0),SKAction.moveTo(y: node.position.y + 100, duration: 2.0)
            ])
        let remove = SKAction.run({
            node.removeFromParent()
            callback()
        })
        let sequence = SKAction.sequence([fadeOutAction, remove])
        node.run(sequence)
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        
        get {
            return true
        }
    }
    
    private func phrase() {
        let phrase = SKLabelNode(fontNamed: "Helvetica Neue UltraLight")
        phrase.text = "Don't be afraid to create"
        phrase.fontSize = 50
        phrase.position = CGPoint(x: 0, y: 85.384)
        phrase.color = .white
        phrase.alpha = 1.0
        
        let fadeOut = SKAction.fadeAlpha(to: 0.3, duration: 1)
        let fadeIn = SKAction.fadeAlpha(to: 1, duration: 1)
        phrase.run(SKAction.repeatForever(SKAction.sequence([fadeOut, fadeIn])))
        
        addChild(phrase)
        
        let phrase2 = SKLabelNode(fontNamed: "Helvetica Neue UltraLight")
        phrase2.text = "your own universe"
        phrase2.fontSize = 50
        phrase2.position = CGPoint(x: 0, y: 46.384)
        phrase2.color = .white
        phrase2.alpha = 1.0
        
        let fadeOut1 = SKAction.fadeAlpha(to: 0.3, duration: 1)
        let fadeIn1 = SKAction.fadeAlpha(to: 1, duration: 1)
        phrase2.run(SKAction.repeatForever(SKAction.sequence([fadeOut1, fadeIn1])))
        
        addChild(phrase2)
        
        
        let phrase3 = SKLabelNode(fontNamed: "Helvetica Neue UltraLight")
        phrase3.text = "Have a Blast"
        phrase3.fontSize = 50
        phrase3.position = CGPoint(x: 0, y: -78.045)
        phrase3.color = .white
        phrase3.alpha = 1.0
        
        let fadeOut2 = SKAction.fadeAlpha(to: 0.3, duration: 1)
        let fadeIn2 = SKAction.fadeAlpha(to: 1, duration: 1)
        phrase3.run(SKAction.repeatForever(SKAction.sequence([fadeOut2, fadeIn2])))
        
        addChild(phrase3)
    }
    
    public func touchDown(atPoint pos : CGPoint) {
        if home{
            home = false
            self.fadeUpAndRemove(node: logo) {}
            self.fadeUpAndRemove(node: label1) {}
            self.fadeUpAndRemove(node: label2) {}
            self.fadeUpAndRemove(node: label3) {}
            self.fadeUpAndRemove(node: label4) {}
            self.fadeUpAndRemove(node: label5) {
                self.phrase()
            }
        }else{
        
        if let scene = GameScene(fileNamed: "GameScene"){
            // Set the scale mode to scale to fit the window
            scene.scaleMode = self.scaleMode
            
            scene.backgroundColor = self.backgroundColor
            
            let transition = SKTransition.crossFade(withDuration: 2.0)
            
            // Present the scene
            self.view!.presentScene(scene, transition: transition)
        }
        }
    }
    
    public func touchMoved(toPoint pos : CGPoint) {
        
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
