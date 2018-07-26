//
//  UIButtonWrapper.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

public class UIButtonWrapper: UIButtonWrapperProtocol {
    var button: UIButton?
    
    public init() {
        
    }
    
    public func setButton(_ button: UIButton?) {
        self.button = button
    }
    
    public func setTitle(_ title: String?, for state: UIControlState) {
        self.button?.setTitle(title, for: .normal)
    }
    
    public func getTitleLabelText() -> String? {
        return button?.titleLabel?.text
    }
    
    public func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        self.button?.addTarget(target, action: action, for: controlEvents)
    }
    
    public func addTopBorderWithColor(_ color: UIColor, width: CGFloat) -> CALayer {
        return self.button!.layer
    }
    
    public func setTag(_ tag: Int) {
        self.button?.tag = tag
    }
}
