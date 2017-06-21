//
//  Object.swift
//  MotionCube
//
//  Created by Gordon RASS-KWASI on 6/20/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import Foundation
import UIKit

enum object {
    case circle
    case square
}

class Form: UIView {
    var type: Int = 0
    
    init(coord: CGPoint, form: object) {
        super.init(frame : CGRect(x: coord.x - 50, y: coord.y - 50, width: 100, height: 100))
        if form == object.circle {
            self.layer.cornerRadius = 50
            self.type = 1
        }
        self.backgroundColor = randomColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        if self.type == 1 {
            return .ellipse
        }
        return .rectangle
    }
}

class FactoryForm {
    
    init() {
    }
    
    func createForm(coord: CGPoint, form: object) -> Form {
        if form == object.circle {
            return Form(coord: coord, form: object.circle)
        }
        return Form(coord: coord, form: object.square)
    }
    
    func createAlea(coord: CGPoint) -> Form {
        let rand = generateRandomNumber(1, 3)
        if rand == 1 {
            return self.createForm(coord: coord, form: object.square)
        }
        return self.createForm(coord: coord, form: object.circle)
    }
}

func randomColor() -> UIColor {
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

func generateRandomNumber(_ min: Int,_ max: Int) -> Int {
    let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
    return randomNum
}

