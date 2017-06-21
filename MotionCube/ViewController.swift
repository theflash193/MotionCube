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
    
    @IBAction func TapAction(_ sender: UITapGestureRecognizer) {
        let square = factory.createForm(coord: sender.location(in: self.view), form: object.square)
        self.view.addSubview(square)
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

