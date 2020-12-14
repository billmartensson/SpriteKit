//
//  MenuScene.swift
//  MySpritekit
//
//  Created by Bill Martensson on 2020-12-14.
//

import Foundation
import SpriteKit

class MenuScene : SKScene
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let thetouch = touches.first!
        
        let touchpos = thetouch.location(in: self)
        
        var startbutton = childNode(withName: "startbutton")!
        
        if(startbutton.contains(touchpos))
        {
            // TRYCKT PÅ STARTKNAPP
            
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            
            
            let newscene = GameScene(fileNamed: "FancyScene")!
            let screenwidth = UIScreen.main.bounds.width
            let screenheight = UIScreen.main.bounds.height
            newscene.size = CGSize(width: (screenwidth/screenheight)*1000, height: 1000)
            
            newscene.scaleMode = .aspectFit
        
            scene?.view!.presentScene(newscene, transition: reveal)
        }
        
        
        
    }
}
