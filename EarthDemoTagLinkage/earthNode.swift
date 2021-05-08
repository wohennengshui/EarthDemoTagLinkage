//
//  earthNode.swift
//  EarthDemoTagLinkage
//
//  Created by li on 2021/3/19.
//

import Foundation
import SceneKit
import SpriteKit

public class earthNode : SCNNode {
    
    
    // Earth
    let bodyNode = SCNNode()
    let label = SKLabelNode(text: "hah")
    let sphere = SCNSphere(radius: 10)
    
    var rotateAround: SCNVector3 = SCNVector3(x:0, y:1, z:0)
    
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
        addClouds()
        addPoles()
        beginDailyRotation()
    }
    
    func addBody() {
        
        sphere.segmentCount = 50
        
        let bodyMaterial = SCNMaterial()
        bodyMaterial.diffuse.contents = "earth2"
        bodyMaterial.specular.contents = "Specular"
        bodyMaterial.emission.contents = "Emission"
        bodyMaterial.normal.contents = "Normal"
        bodyMaterial.shininess = 0.5
        sphere.firstMaterial = bodyMaterial
        bodyNode.geometry = sphere
        bodyNode.position = SCNVector3(x: 0, y: 0, z: 0)
        bodyNode.name = "earthNode"
        addChildNode(bodyNode)
    }

    func addClouds() {
        // Clouds
        let atmosNode = SCNNode()
        let atmosSphere = SCNSphere(radius: 1.01)
        atmosSphere.segmentCount = 50
        
        let atmosMaterial = SCNMaterial()
        atmosMaterial.diffuse.contents = "Clouds"
        atmosMaterial.transparent.contents = "Clouds"
        atmosSphere.firstMaterial = atmosMaterial
        atmosNode.geometry = atmosSphere
        addChildNode(atmosNode)
    }
    
    func addPoles() {
        // Poles
        let poleNode = SCNNode()
        let pole = SCNCylinder(radius: 0.01, height: 2.2)
        poleNode.geometry = pole
        
        let poleMaterial = SCNMaterial()
        poleMaterial.diffuse.contents = SKColor.red
        pole.firstMaterial = poleMaterial
        addChildNode(poleNode)
    }
    
    
    func beginDailyRotation() {
        let action = SCNAction.rotate(by: CGFloat(360.0 * SCNFloat((.pi/180.0))), around: rotateAround, duration: 1)
//        let repeatAction = SCNAction.repeatForever(action)
        runAction(action)
        
    }
  
    
    
}

