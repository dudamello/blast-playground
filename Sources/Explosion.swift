import Foundation
import SpriteKit

class Explosion {
    
    
    
    private let textures = [SKTexture(imageNamed: "bolinhas1"),
                            SKTexture(imageNamed: "bolinhas2"),
                            SKTexture(imageNamed: "bolinhas3"),
                            SKTexture(imageNamed: "bolinhas4"),
                            SKTexture(imageNamed: "bolinhas5"),
                            SKTexture(imageNamed: "bolinhas6"),
                            SKTexture(imageNamed: "bolinhas7"),
                            SKTexture(imageNamed: "bolinhas8"),
                            SKTexture(imageNamed: "bolinhas9"),
                            SKTexture(imageNamed: "bolinhas10"),
                            SKTexture(imageNamed: "bolinhas11"),
                            SKTexture(imageNamed: "bolinhas12"),]
    
    init() {
        
    }
    
    func explode(pos: CGPoint, star: SKSpriteNode, parent: SKNode) {
        
        
        let qtde = Int.random(in: 10...25)
        for _ in 0...qtde {
            let color = Int.random(in: 0...7)
            let b = Ball(pos: pos, texture: textures[color])
            star.addChild(b.node)
            b.createNodes()
        }
        
        let waitexplosion = SKAction.wait(forDuration: 1.8)
        let scaledown = SKAction.scale(to: 0.01, duration: 0.5)
        let move = SKAction.move(to: pos, duration: 0.5)
        let groupActions = SKAction.group([scaledown, move]) //move
        star.run(SKAction.sequence([waitexplosion, groupActions])) {
            for node in star.children {
                node.removeFromParent()
                star.setScale(1.0)
                star.position = CGPoint.zero
            }
            let point = SKShapeNode(circleOfRadius: CGFloat.random(in: 1...4))
            point.fillColor = SKColor.white
            point.position = pos
            point.zPosition = -1
            
            parent.addChild(point)
            savepoint.append(point)
            if savepoint.count > 190 {
                let firstPoint = savepoint[0]
                savepoint.remove(at: 0)
                firstPoint.removeFromParent()
            }

            let fadeOut = SKAction.fadeAlpha(to: 0.1, duration: 0.5)
            let fadeIn = SKAction.fadeAlpha(to: 0.5, duration: 0.5)
            
            point.run(SKAction.repeatForever(SKAction.sequence([fadeOut, fadeIn])))
        }
    }
}
