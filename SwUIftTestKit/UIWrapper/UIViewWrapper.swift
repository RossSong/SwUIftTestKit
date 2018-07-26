//
//  UIViewWrapper.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

class UIViewWrapper: UIViewWrapperProtocol {
    var view: UIView?
    
    func setView(_ view: UIView) {
        self.view = view
    }
}
