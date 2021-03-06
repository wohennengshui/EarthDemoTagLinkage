////
////  buttonTouch.swift
////  earthDemo
////
////  Created by li on 2021/3/19.
////
//
//import SpriteKit
//import UIKit
//import SceneKit
//class buttonTouch: SCNNode{
//    /**
//         在创建完成后，调用touchUpInside方法来触发点击事件
//     */
//    private var m_ButtonLabel : SKLabelNode?;
//    private var border : SKShapeNode?;
//
//    //边框颜色
//    public var borderColor : SKColor = SKColor.yellow{
//        didSet{
//            border?.strokeColor = borderColor;
//        }
//    };
//    //按钮背景颜色
//    public var m_BackgroundColor : SKColor = SKColor.white{
//        didSet{
//            border?.fillColor = m_BackgroundColor;
//        }
//    };
//    //按钮文字
//    public var m_LabelText : String = "Label"{
//        didSet{
//            m_ButtonLabel?.text = m_LabelText;
//        }
//    };
//    //按钮字体颜色
//    public var m_fontColor : SKColor = .black{
//        didSet{
//            m_ButtonLabel?.fontColor = m_fontColor;
//        }
//    };
//    //按钮边框宽度
//    public var m_borderLineWidth:CGFloat = 1{
//        didSet{
//            border?.lineWidth = m_borderLineWidth;
//        }
//    }
//
//    //按钮文字字体
//    public var m_FontName : String = ""{
//        didSet{
//            m_ButtonLabel?.fontName = m_FontName;
//        }
//    }
//    //按钮文字尺寸
//    public var m_FontSize : CGFloat = 20 {
//        didSet{
//            m_ButtonLabel?.fontSize = m_FontSize;
//        }
//    }
//
//    public var clickEvent = {};
//
//
//    convenience init(btnName : String,btnSize:CGSize,btnCornerRadius:CGFloat) {
//        self.init(color: .clear, size: btnSize);
//        self.color = .clear;
//        self.name = btnName;
//        let location = CGRect(x: -self.frame.size.width/2, y:-self.frame.size.height/2 , width: self.frame.size.width, height: self.frame.size.height);
//        border = SKShapeNode(rect: location, cornerRadius: btnCornerRadius);
//        border!.fillColor = m_BackgroundColor;
//        border?.lineWidth = m_borderLineWidth;
//        border?.strokeColor = borderColor;
//        self.addChild(border!);
//
//        m_ButtonLabel = SKLabelNode(text: m_LabelText);
//        m_ButtonLabel?.position = CGPoint(x: 0, y: -((m_ButtonLabel?.frame.size.height)!/2));
//        m_ButtonLabel?.fontColor = m_fontColor;
//        m_ButtonLabel?.fontName = m_FontName;
//        m_ButtonLabel?.fontSize = m_FontSize;
//        self.addChild(m_ButtonLabel!);
//    }
//
//    public func touchUpInside(highLightBGColor:SKColor,highLightFontColor:SKColor){
//        let oldBGColor = self.m_BackgroundColor;
//        let oldFontColor = self.m_fontColor;
//        self.m_BackgroundColor = highLightBGColor;
//        self.m_fontColor = highLightFontColor;
//        let waitTime = SKAction.wait(forDuration: 0.05);
//        let bgcolor = SKAction.run {
//            self.m_BackgroundColor = oldBGColor;
//            self.m_fontColor = oldFontColor;
//        }
//        self.run(SKAction.sequence([waitTime,bgcolor]));
//        clickEvent();
//    }
//
//
//
//}
