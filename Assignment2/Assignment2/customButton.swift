//
//  customButton.swift
//  Assignment2
//
//  Created by Chelsea Voutier on 13/5/17.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit

class customButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5
        
    }
    

}
