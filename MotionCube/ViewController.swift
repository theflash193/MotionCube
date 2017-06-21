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
    let dynamic = UIDynamicAnimator()
    
    @IBAction func TapAction(_ sender: UITapGestureRecognizer) {
        let square = factory.createAlea(coord: sender.location(in: self.view))
        self.view.addSubview(square)
        
        let gravity = UIGravityBehavior()
        gravity.magnitude = 3
        dynamic.addBehavior(gravity)
        gravity.addItem(square)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

