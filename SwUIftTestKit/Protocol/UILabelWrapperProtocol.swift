//
//  UILabelWrapperProtocol.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

public protocol UILabelWrapperProtocol {
    func setLabel(_ label: UILabel?)
    func setText(_ text: String?)
    func setAttributedText(_ atturibtedText: NSAttributedString)
    func setTextColor(_ textColor: UIColor?)
    func setFont(_ font: UIFont?)
    
    func getText() -> String?
    func getTextColor() -> UIColor?
    func getFont() -> UIFont?
}
