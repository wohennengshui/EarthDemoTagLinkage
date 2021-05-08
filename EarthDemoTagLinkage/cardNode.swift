//
//  cardNode.swift
//  EarthDemoTagLinkage
//
//  Created by li on 2021/3/21.
//

import Foundation
import SceneKit
import SpriteKit

public class cardNode : SCNNode {
    
    
    // Earth
    let bodyNode1 = SCNNode()
    let bodyNode2 = SCNNode()
    let bodyNode3 = SCNNode()
    
    public override init() {
        super.init()
        build()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }
    
    func build() {
        addBody()
//        beginDailyRotation()
    }
    
    func addBody() {
        let cuboid1 = SCNPlane(width: 5, height: 2)
        let cuboid2 = SCNPlane(width: 5, height: 2)
        let cuboid3 = SCNPlane(width: 5, height: 2)
        
        let text1 = SCNText(string: "新闻", extrusionDepth: 0.01)
        let textNode1 = SCNNode(geometry: text1)
        textNode1.position = SCNVector3(x: -1, y: -2, z: 0)
        text1.font = UIFont.systemFont(ofSize: 1)

        let text2 = SCNText(string: "新闻", extrusionDepth: 0.01)
        let textNode2 = SCNNode(geometry: text2)
        textNode2.position = SCNVector3(x: -1, y: -2, z: 0)
        text2.font = UIFont.systemFont(ofSize: 1)
        
        let text3 = SCNText(string: "新闻", extrusionDepth: 0.01)
        let textNode3 = SCNNode(geometry: text3)
        textNode3.position = SCNVector3(x: -1, y: -2, z: 0)
        text3.font = UIFont.systemFont(ofSize: 1)
        
        let bodyMaterial1 = SCNMaterial()
        bodyMaterial1.diffuse.contents = UIColor.brown
        bodyMaterial1.shininess = 0.5
        
        let bodyMaterial2 = SCNMaterial()
        bodyMaterial2.diffuse.contents = UIColor.yellow
        bodyMaterial2.shininess = 0.5
        
        let bodyMaterial3 = SCNMaterial()
        bodyMaterial3.diffuse.contents = UIColor.green
        bodyMaterial3.shininess = 0.5
        
        cuboid1.firstMaterial = bodyMaterial1
        cuboid2.firstMaterial = bodyMaterial2
        cuboid3.firstMaterial = bodyMaterial3
        
        bodyNode1.geometry = cuboid1
        bodyNode1.position = SCNVector3(x: 0, y: 5, z: 10)
        
        bodyNode2.geometry = cuboid2
        bodyNode2.position = SCNVector3(x: 10, y: 5, z: 5)
        
        bodyNode3.geometry = cuboid3
        bodyNode3.position = SCNVector3(x: 5, y: 10, z: 0)
        
        bodyNode1.name = "card"
        bodyNode2.name = "card"
        bodyNode3.name = "card"
        
        bodyNode1.addChildNode(textNode1)
        bodyNode2.addChildNode(textNode2)
        bodyNode3.addChildNode(textNode3)
        addChildNode(bodyNode1)
        addChildNode(bodyNode2)
        addChildNode(bodyNode3)
    }

//
//    func beginDailyRotation() {
//        let action = SCNAction.rotate(by: CGFloat(360.0 * SCNFloat((.pi/180.0))), around: SCNVector3(x:0, y:1, z:0), duration: 20)
//        let repeatAction = SCNAction.repeatForever(action)
//        runAction(repeatAction)
//
//    }
    
    
    
}

