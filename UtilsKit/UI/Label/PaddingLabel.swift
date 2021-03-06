//
//  PaddingLabel.swift
//  UtilsKit
//
//  Created by RGMC on 09/11/2018.
//  Copyright © 2018 RGMC. All rights reserved.
//

import UIKit

/**
 Label with padding configurable from storyboard
 */
@IBDesignable open class PaddingLabel: UILabel {
    
    // MARK: - Inspectables
    @IBInspectable public var topInset: CGFloat = 0.0
    @IBInspectable public var bottomInset: CGFloat = 0.0
    @IBInspectable public var leftInset: CGFloat = 0.0
    @IBInspectable public var rightInset: CGFloat = 0.0
    
    // MARK: - Variables
    override open var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize: CGSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
    
    // MARK: - Draw
    override open func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
}
