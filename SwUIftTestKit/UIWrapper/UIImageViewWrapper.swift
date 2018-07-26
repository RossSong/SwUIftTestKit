//
//  UIImageViewWrapper.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

class UIImageViewWrapper: UIImageViewWrapperProtocol {
    var imageView: UIImageView?
    
    func setImageView(_ imageView: UIImageView?) {
        self.imageView = imageView
    }
    
    func setIsHidden(_ value: Bool) {
        self.imageView?.isHidden = value
    }
    
    func setImage(_ image: UIImage?) {
        self.imageView?.image = image
    }
}
