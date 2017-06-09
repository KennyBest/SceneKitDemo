//
//  Atoms.swift
//  SceneKitDemo
//
//  Created by llj on 2017/6/9.
//  Copyright © 2017年 llj. All rights reserved.
//

import UIKit
import SceneKit

// 这里要熟悉SCNGeometry的子类，常用的几何形状

class Atoms: NSObject {
    class func carbonAtom() -> SCNGeometry {
        // 设置范围 以radius为半径的圆
        let carbonAtom = SCNSphere(radius: 1.70)
        
        // firstMaterial 第一手材料
        carbonAtom.firstMaterial!.diffuse.contents = UIColor.darkGray
        carbonAtom.firstMaterial!.specular.contents = UIColor.white
        
        return carbonAtom
    }
    
    class func hydrogenAtom() -> SCNGeometry {
        let hydrogenAtom = SCNSphere(radius: 1.20)
        hydrogenAtom.firstMaterial!.diffuse.contents = UIColor.lightGray
        hydrogenAtom.firstMaterial!.specular.contents = UIColor.white
        
        return hydrogenAtom
    }
    
    class func oxygenAtom() -> SCNGeometry {
        let oxygenAtom = SCNSphere(radius: 1.52)
        
        oxygenAtom.firstMaterial?.diffuse.contents = UIColor.red
        oxygenAtom.firstMaterial?.specular.contents = UIColor.white
        
        return oxygenAtom
    }
    
    class func fluorineAtom() -> SCNGeometry {
        let fluorineAtom = SCNSphere(radius: 1.47)
        
        fluorineAtom.firstMaterial?.diffuse.contents = UIColor.yellow
        fluorineAtom.firstMaterial?.specular.contents = UIColor.white
        
        return fluorineAtom
    }
    
    // 创建圆筒
    class func cylinderAtom() -> SCNGeometry {
        let cylinderAtom = SCNCylinder(radius: 3.0, height: 3.0)
        
        cylinderAtom.firstMaterial?.diffuse.contents = UIColor.green
        cylinderAtom.firstMaterial?.specular.contents = UIColor.white
        
        return cylinderAtom
    }
    
    // SCNPlane 长方形
    
    class func allAtoms() -> SCNNode {
        let atomNode = SCNNode()
        
        let carbonNode = SCNNode(geometry: carbonAtom())
        carbonNode.position = SCNVector3Make(-6, 0, 0)
        atomNode.addChildNode(carbonNode)
        
        let hydrogenNode = SCNNode(geometry: hydrogenAtom())
        hydrogenNode.position = SCNVector3Make(-2, 0, 0)
        atomNode.addChildNode(hydrogenNode)
        
        let oxygenNode = SCNNode(geometry: oxygenAtom())
        oxygenNode.position = SCNVector3Make(2, 0, 0)
        atomNode.addChildNode(oxygenNode)
        
        let fluorineNode = SCNNode(geometry: fluorineAtom())
        fluorineNode.position = SCNVector3Make(6, 0, 0)
        atomNode.addChildNode(fluorineNode)
        
        let cylinderNode = SCNNode(geometry: cylinderAtom())
        cylinderNode.position = SCNVector3Make(0, -6, 0)
        atomNode.addChildNode(cylinderNode)
        
        return atomNode
    }
}
