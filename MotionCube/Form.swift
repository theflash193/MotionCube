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
    init(coord: CGPoint, form: object) {
        super.init(frame : CGRect(x: coord.x - 50, y: coord.y - 50, width: 100, height: 100))
        if form == object.circle {
            self.layer.cornerRadius = 50
        }
        self.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
