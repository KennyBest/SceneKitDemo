//
//  ViewController.swift
//  SceneKitDemo
//
//  Created by llj on 2017/6/8.
//  Copyright © 2017年 llj. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScene()
    }
    
    func setupScene() {
        // 1
        let scene = SCNScene()
        
        // 2
        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        let boxNode = SCNNode(geometry: boxGeometry)
        scene.rootNode.addChildNode(boxNode)
        
        // 3
        sceneView.scene = scene
    }
}

