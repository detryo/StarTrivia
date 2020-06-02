//
//  FadeEnableButton.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 22/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class FadeEnableButton : UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled == true {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
