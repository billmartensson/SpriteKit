//
//  ContentView.swift
//  MySpritekit
//
//  Created by Bill Martensson on 2020-12-10.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var scene: SKScene {
        let scene = GravityScene(fileNamed: "GravityScene")!
        //let scene = GameScene(fileNamed: "FancyScene")!
        let screenwidth = UIScreen.main.bounds.width
        let screenheight = UIScreen.main.bounds.height
        scene.size = CGSize(width: (screenwidth/screenheight)*1000, height: 1000)
        
        //scene.size = CGSize(width: screenwidth, height: screenheight)
        
        scene.scaleMode = .aspectFit
    
        return scene
    }
    
    var body: some View {
        
        GeometryReader { gr in
            SpriteView(scene: scene)
                .frame(width: gr.size.width, height: gr.size.height)
        }
        
        .ignoresSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class GravityScene : SKScene
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let thetouch = touches.first!
        
        let touchpos = thetouch.location(in: self)
        
        var player = childNode(withName: "player")!
        
        if(player.contains(touchpos))
        {
            // TRYCKT PÅ PLAYER
        }
        
        if(touchpos.x < size.width / 2)
        {
            // FLYTTA PLAYER VÄNSTER
        } else {
            // FLYTTA PLAYER HÖGER
        }
        
    }
}

class GameScene : SKScene
{
    override func didMove(to view: SKView) {
        
        var player = childNode(withName: "player")!
        
        var frames = [SKTexture]()
                
        frames.append(SKTexture(imageNamed: "frame-1"))
        frames.append(SKTexture(imageNamed: "frame-2"))

        player.run(SKAction.repeatForever(
                    SKAction.animate(with: frames,
                                     timePerFrame: 0.5,
                                     resize: false,
                                     restore: true)), withKey: "flapping")
        
        player.run(SKAction.repeatForever(SKAction.moveBy(x: 10, y: -10, duration: 0.1)))
        
        
    }
    
    /*
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for tu in touches {
            let box = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
            
            box.position = tu.location(in: self)
            
            
            
            box.run(SKAction.sequence([SKAction.moveBy(x: 0, y: 200, duration: 1), SKAction.removeFromParent()]))
            
            addChild(box)
        }
        
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let theTouch = touches.first!
        
        var player = childNode(withName: "player")!
        
        //player.position = theTouch.location(in: self)
        
        player.run(SKAction.moveBy(x: 0, y: 100, duration: 0.1))
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        var player = childNode(withName: "player")!
        var hinder = childNode(withName: "hinder")!
        var goal = childNode(withName: "goal")!
        
        if(player.intersects(goal))
        {
            print("WINNER!!")
        }
        
        for hinderitem in hinder.children
        {
            if(player.intersects(hinderitem))
            {
                print("DEAD!")
            }
        }
        
    }
}
