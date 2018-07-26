//
//  UIImageViewWrapper.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

public class UIImageViewWrapper: UIImageViewWrapperProtocol {
    var imageView: UIImageView?
    
    public func setImageView(_ imageView: UIImageView?) {
        self.imageView = imageView
    }
    
    public func setIsHidden(_ value: Bool) {
        self.imageView?.isHidden = value
    }
    
    public func setImage(_ image: UIImage?) {
        self.imageView?.image = image
    }
}
