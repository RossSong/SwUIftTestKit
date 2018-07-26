//
//  UILabelWrapper.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

public class UILabelWrapper: UILabelWrapperProtocol {
    var label: UILabel?
    
    public init() {
        
    }
    
    public func setLabel(_ label: UILabel) {
        self.label = label
    }
    
    public func setText(_ text: String?) {
        self.label?.text = text
    }
    
   public  func setAttributedText(_ atturibtedText: NSAttributedString) {
        self.label?.attributedText = atturibtedText
    }
    
    public func setTextColor(_ textColor: UIColor?) {
        self.label?.textColor = textColor
    }
    
    public func setFont(_ font: UIFont?) {
        self.label?.font = font
    }
    
    public func getText() -> String? {
        return self.label?.text
    }
    
    public func getTextColor() -> UIColor? {
        return self.label?.textColor
    }
    
    public func getFont() -> UIFont? {
        return self.label?.font
    }
}
