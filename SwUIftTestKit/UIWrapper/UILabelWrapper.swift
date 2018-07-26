//
//  UILabelWrapper.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

class UILabelWrapper: UILabelWrapperProtocol {
    var label: UILabel?
    
    func setLabel(_ label: UILabel) {
        self.label = label
    }
    
    func setText(_ text: String?) {
        self.label?.text = text
    }
    
    func setAttributedText(_ atturibtedText: NSAttributedString) {
        self.label?.attributedText = atturibtedText
    }
    
    func setTextColor(_ textColor: UIColor?) {
        self.label?.textColor = textColor
    }
    
    func setFont(_ font: UIFont?) {
        self.label?.font = font
    }
    
    func getText() -> String? {
        return self.label?.text
    }
    
    func getTextColor() -> UIColor? {
        return self.label?.textColor
    }
    
    func getFont() -> UIFont? {
        return self.label?.font
    }
}
