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
    @IBInspectable public var startInset: CGFloat = 0.0
    @IBInspectable public var endInset: CGFloat = 0.0
    
    private var leftInset : CGFloat {
        get {
            if isRightToLeft() {
                return endInset
            }
            return startInset
        }
    }
    
    private var rightInset : CGFloat {
        get {
            if isRightToLeft() {
                return startInset
            }
            return endInset
        }
    }
    
    // MARK: - Variables
    override open var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize: CGSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += startInset + endInset
        return intrinsicSuperViewContentSize
    }
    
    // MARK: - Draw
    override open func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    private func isRightToLeft() -> Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
}
