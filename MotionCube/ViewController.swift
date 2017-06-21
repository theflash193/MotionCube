//
//  ViewController.swift
//  MotionCube
//
//  Created by Gordon RASS-KWASI on 6/20/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var factory = FactoryForm()
    var dynamic = UIDynamicAnimator()
    let gravity = UIGravityBehavior()
//    var boundries = UICollisionBehavior?
    let collision = UICollisionBehavior()
    
    @IBAction func TapAction(_ sender: UITapGestureRecognizer) {
        let square = factory.createAlea(coord: sender.location(in: self.view))
        self.view.addSubview(square)
        let boundries = UICollisionBehavior(items: [square])
        boundries.translatesReferenceBoundsIntoBoundary = true
        gravity.addItem(square)
        collision.addItem(square)
        boundries.addItem(square)
        dynamic.addBehavior(boundries)
        dynamic.addBehavior(collision)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamic = UIDynamicAnimator(referenceView: self.view)
        gravity.magnitude = 3
        
        dynamic.addBehavior(gravity)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

