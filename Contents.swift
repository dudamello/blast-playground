/*:
 
 # **BLAST**
 ## **Use in fullscreen for a better experience**
*/
//#-hidden-code


//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1024, height: 768))
if let scene = FirstScene(fileNamed: "GameScene2"){
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    scene.backgroundColor = UIColor(hue: 207/255, saturation: 60/255, brightness: 23/255, alpha: 1)
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//#-end-hidden-code
