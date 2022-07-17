//
//  UIView+Extension.swift
//  CCC-2nd-Toss-Neal
//
//  Created by yudonlee on 2022/07/11.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
