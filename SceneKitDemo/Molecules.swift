//
//  Molecules.swift
//  SceneKitDemo
//
//  Created by llj on 2017/6/9.
//  Copyright © 2017年 llj. All rights reserved.
//

import UIKit
import SceneKit

class Molecules: NSObject {
    class func methaneMolecule() -> SCNNode {
        let methaneMolecule = SCNNode()
        
        let _ = nodeWithAtom(atom: Atoms.carbonAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, 0, 0))
        
        let positions: [SCNVector3] = [
            SCNVector3Make(-4, 0, 0),
            SCNVector3Make(4, 0, 0),
            SCNVector3Make(0, -4, 0),
            SCNVector3Make(0, 4, 0)
        ]
        
        for position in positions {
            let _ = nodeWithAtom(atom: Atoms.hydrogenAtom(), molecule: methaneMolecule, position: position)
        }
        
        return methaneMolecule
    }
    
    class func ethanoMolecule() -> SCNNode {
        var ethanolMolecule = SCNNode()
        return ethanolMolecule
    }
    
    class func ptfeMolecule() -> SCNNode {
        var ptfeMolecule = SCNNode()
        return ptfeMolecule
    }
    
    class func nodeWithAtom(atom: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: atom)
        node.position = position
        molecule.addChildNode(node)
        return node
    }
    
}
