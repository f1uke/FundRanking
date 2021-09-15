//
//  UIGradientView.swift
//  FundRanking
//
//  Created by Sattra on 9/15/21.
//

import Foundation
import UIKit

@IBDesignable class UIGradientView: UICustomView {
    
    @IBInspectable var _1stColor:  UIColor = UIColor.clear {
        didSet {
            updateGradientLayer()
        }
    }
    
    @IBInspectable var _2ndColor: UIColor = UIColor.clear {
        didSet {
            updateGradientLayer()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet {
            updateGradientLayer()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateGradientLayer() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [_1stColor, _2ndColor].map{$0.cgColor}
        
        if (self.isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
        
    }
    
}
