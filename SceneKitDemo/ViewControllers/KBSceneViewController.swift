//
//  KBSceneViewController.swift
//  SceneKitDemo
//
//  Created by llj on 2017/6/15.
//  Copyright © 2017年 llj. All rights reserved.
//

import UIKit
import SceneKit

class KBSceneViewController: UIViewController {
    
    var sceneView: SCNView!
    var scene: SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "SCNView"
        view.backgroundColor = .white
        setupSceneView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupSceneView() {
        sceneView = SCNView(frame: self.view.bounds)
        sceneView.backgroundColor = .red
        
        scene = SCNScene()
        scene.rootNode.addChildNode(setupPlane())
        scene.rootNode.addChildNode(setupBox())
        sceneView.scene = scene
        
        view.addSubview(sceneView)
    }
    
    // SCNPlane 创建平面节点
    func setupPlane() -> SCNNode {
        let node = SCNNode()
        
        let geometry = SCNPlane()
        geometry.firstMaterial?.diffuse.contents = UIColor.blue
        geometry.firstMaterial?.specular.contents = UIColor.white
        node.geometry = geometry
        
        return node
    }
    
    // SCNBox
    func setupBox() -> SCNNode {
        let box = SCNBox(width: 100, height: 100, length: 100, chamferRadius: 10)
        box.firstMaterial?.diffuse.contents = UIColor.red
        box.firstMaterial?.specular.contents = UIColor.white
        
        let node = SCNNode(geometry: box)
        return node
    }
    
}
