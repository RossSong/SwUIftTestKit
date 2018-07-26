//
//  UIButtonWrapperProtocol.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

public protocol UIButtonWrapperProtocol {
    func setButton(_ button: UIButton)
    func setTitle(_ title: String?, for state: UIControlState)
    func getTitleLabelText() -> String?
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
    func addTopBorderWithColor(_ color: UIColor, width: CGFloat) -> CALayer
    func setTag(_ tag: Int)
}
