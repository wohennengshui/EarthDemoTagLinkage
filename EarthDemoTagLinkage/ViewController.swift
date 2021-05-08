//
//  ViewController.swift
//  EarthDemoTagLinkage
//
//  Created by li on 2021/3/19.
//

import UIKit
import SceneKit
import SpriteKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    lazy var enterBtn = UIButton()
    lazy var resetBtn = UIButton()
    lazy var earthView = SCNView()
    lazy var scene = SCNScene()
    lazy var cameraNode = SCNNode()
    lazy var secondNode: SCNNode = cardNode()
    lazy var earthNodee: SCNNode = earthNode()
    

    lazy var testSKView = SKScene()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        earthView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(earthView)
        earthView.backgroundColor = UIColor.clear
        defaultView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandle(gesture:)))
        earthView.addGestureRecognizer(tap)
    }
    
    @objc func resetEarth() {
//        let action = SCNAction.rotate(by: CGFloat(360.0 * SCNFloat((.pi/180.0))), around: SCNVector3(x:0, y:1, z:0), duration: 1)
//        let action = SCNAction.rotate(toAxisAngle: SCNVector4Zero, duration: 1)
//        earthView.scene?.rootNode.rotation = SCNVector4Make(0, 1, 0, Float(angle))
//        earthView.scene?.rootNode.eulerAngles
        let action = SCNAction.rotateBy(x: 0, y: 0, z: 0, duration: 1)
        earthView.scene?.rootNode.runAction(action)
        
    }
    
    @objc func tapHandle(gesture:UITapGestureRecognizer){
        let results:[SCNHitTestResult] = (self.earthView.hitTest(gesture.location(ofTouch: 0, in: self.earthView), options: nil))
        guard let firstNode  = results.first else{
            return
        }
        // 点击到的节点
//        print(firstNode.node.name)
        if firstNode.node.name == "card" {
            let vc = newsVC()
            self.present(vc, animated: true, completion: nil)
        }
        if firstNode.node.name == "earthNode" {
//            let rotateAround: SCNVector3 = SCNVector3(x:0, y:1, z:0)
//            let action = SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 1)
//            earthView.scene?.rootNode.runAction(action)
            
            
            
        }


     
        
    }
    
    
    @objc func enterEarth() {
        
        let backimg = UIImageView(image: UIImage(named: "back"))
        view.insertSubview(backimg, belowSubview: earthView)
        backimg.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        
        earthView.allowsCameraControl = true
        earthView.scene = scene
        scene.rootNode.addChildNode(earthNodee)
        
        earthNodee.addChildNode(secondNode)

        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 50)
//        cameraNode.camera?.averageGray
        scene.rootNode.addChildNode(cameraNode)
        setLight()
//        addGesture()
    }

    func setLight() {
        // Create a strong light
        let light = SCNLight()
        light.type = .area
        light.temperature = 6300
        light.intensity = 3500
        light.castsShadow = true
        light.shadowSampleCount = 16
        light.shadowBias = 2
        light.shadowRadius = 10

        let lightNode = SCNNode()
        lightNode.light = light

        scene.rootNode.addChildNode(lightNode)
    }
    
    

    
    
    func defaultView() {
        self.earthView.addSubview(enterBtn)
        self.earthView.addSubview(resetBtn)
        enterBtn.frame = CGRect(x: 60, y: 100, width: 100, height: 40)
        enterBtn.setTitle("进入地球", for: .normal)
        enterBtn.titleLabel?.textColor = UIColor.black
        enterBtn.backgroundColor = UIColor.green
        enterBtn.addTarget(self, action: #selector(enterEarth), for: .touchUpInside)
        
        resetBtn.frame = CGRect(x: 60, y: self.view.bounds.height - 100, width: 100, height: 40)
        resetBtn.setTitle("重置地球", for: .normal)
        resetBtn.titleLabel?.textColor = UIColor.black
        resetBtn.backgroundColor = UIColor.green
        resetBtn.addTarget(self, action: #selector(resetEarth), for: .touchUpInside)
    }
    
    
    
    
    func addGesture() {
//        // 平移手势
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(panGesture:)))
        panGesture.delegate = self;
        earthView.addGestureRecognizer(panGesture)
//         缩放手势
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(pinchGesture:)))
        pinchGesture.delegate = self
        earthView.addGestureRecognizer(pinchGesture)
//        // 旋转手势
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(rotationGesture:)))
        rotationGesture.delegate = self;
        earthView.addGestureRecognizer(rotationGesture)
//        // 点击手势
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//        tapGesture.delegate = self;
//        [_scnView addGestureRecognizer:tapGesture];
    }
    
    
    @objc func panned(panGesture: UIPanGestureRecognizer) {
        // 平移手势
        
        let transPoint = panGesture.translation(in: earthView)
        // 单指
        if panGesture.numberOfTouches == 1 {
            let TX = transPoint.x * 0.05
            let TY = -transPoint.y * 0.05
            
            let pan: SCNAction = SCNAction.moveBy(x: TX, y: TY, z: 0, duration: 0)
            earthNodee.runAction(pan)
        } else if panGesture.numberOfTouches == 2 {
            // 双指
            // 偏转角度
            var angle = transPoint.y / self.view.bounds.height * 10000
            // x轴累计偏转角
            var XAngle = 90.0
            XAngle = Double(angle) + XAngle
            // 40°~90°阈值
            if (XAngle > 90) {
                XAngle = 90
                angle = 0
            } else if (XAngle < 40) {
                XAngle = 40
                angle = 0
            }
            var an = CGFloat(angle * CGFloat.pi/180)
            if transPoint.y > 0 {
                an = -an
            }
//            let action = SCNAction.rotate(by: an, around: SCNVector3Make(0, 1, 0), duration: 0)
//            earthNodee.runAction(action)
        }
        panGesture.setTranslation(CGPoint(x: 0, y: 0), in: earthView)
    }
    
    
    @objc func pinch(pinchGesture: UIPinchGestureRecognizer) {
        if pinchGesture.numberOfTouches < 2 {
            return
        }
        let scaleAction = SCNAction.scale(by: pinchGesture.scale, duration: 0)
        earthNodee.runAction(scaleAction)
        pinchGesture.scale = 1.0
        
    }
    
    @objc func rotation(rotationGesture: UIRotationGestureRecognizer) {
        let XAngle:Double = 90.0
        // 旋转角度
        let rotate = rotationGesture.rotation
        // 模型平面垂直向量
        let v: SCNVector3 = SCNVector3Make(0, Float(CGFloat(cos(XAngle*Double.pi/180.0))), Float(CGFloat(sin(XAngle*Double.pi/180.0))))
//        let vv = SCNVector3(0,1,0)
        // Action
        let rotateAction = SCNAction.rotate(by: -rotate, around: v, duration: 0)
        earthNodee.runAction(rotateAction)
        
        rotationGesture.rotation = 0
        
    }
    
    
    
    

}

