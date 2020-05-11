import Foundation
import SpriteKit

public class Ball {
    var node : SKSpriteNode
    var firstSize: CGFloat = 1.0
    var x: CGFloat = 0
    var y: CGFloat = 0
    var directionX: CGFloat = 0
    var directionY: CGFloat = 0
    var texture: SKTexture
    
    
    init(pos: CGPoint, texture: SKTexture) {
        self.node = SKSpriteNode(texture: texture)
        self.node.position = pos
        self.texture = texture
        var negative = Int.random(in: 0...1) == 1 ? CGFloat(1) : CGFloat(-1)
        self.directionX = CGFloat.random(in: 0.1...8) * negative
        negative = Int.random(in: 0...1) == 1 ? CGFloat(1) : CGFloat(-1)
        self.directionY = CGFloat.random(in: 0.1...8) * negative
    }
    
    public func createNodes () {
        for i in 1...65 {
            firstSize -= 0.012
            x -= self.directionX * CGFloat.random(in: 0.2...6)
            y -= self.directionY * CGFloat.random(in: 0.2...6)
            let c = SKSpriteNode(texture: texture)
            c.position = CGPoint(x: self.x*0.15, y: self.y*0.15)
            c.color = self.node.color
            c.setScale(firstSize)
            node.addChild(c)
            c.isHidden = true
            c.run(SKAction.sequence([SKAction.wait(forDuration:Double(i)*0.02), SKAction.customAction(withDuration: 0.0) { (node, elapsedTime) in
                node.isHidden = false
            }]))
        }
    }
}
