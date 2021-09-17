//
//  UICustomView.swift
//  FundRanking
//
//  Created by Sattra on 9/15/21.
//

import Foundation
import UIKit

@IBDesignable class UICustomView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
