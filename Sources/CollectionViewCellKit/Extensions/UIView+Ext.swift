//
//  UIView+Ext.swift
//  
//
//  Created by Wesley Calazans on 08/05/23.
//

import UIKit

extension UIView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        var cornerMask = CACornerMask()
        
        if(corners.contains(.topLeft)) {
            cornerMask.insert(.layerMinXMinYCorner)
        }
        
        if(corners.contains(.topRight)) {
            cornerMask.insert(.layerMaxXMinYCorner)
        }
        
        if(corners.contains(.bottomLeft)) {
            cornerMask.insert(.layerMinXMaxYCorner)
        }
        
        if(corners.contains(.bottomRight)) {
            cornerMask.insert(.layerMaxXMaxYCorner)
        }
        
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = cornerMask
    }
}

extension UIView {
    public func pin(to superView: UIView, constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: constant),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -constant),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -constant),
        ])
    }
}

extension UIView {
    public func pinWhitoutBottom(to superView: UIView, constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: constant),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -constant)
        ])
    }
}
