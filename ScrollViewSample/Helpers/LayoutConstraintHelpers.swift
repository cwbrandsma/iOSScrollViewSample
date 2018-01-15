//
//  NSConstraintExtensions.swift
//  connect
//
//  Created by Chris Brandsma on 10/19/16.
//  Copyright © 2016 Communispace. All rights reserved.
//

import Foundation
import UIKit

typealias LC = NSLayoutConstraint

extension UIView {
    func addSubview(_ aView:UIView, withConstraints: [NSLayoutConstraint]) {
        aView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(aView)
        self.addConstraints(withConstraints)
    }
}

extension NSLayoutConstraint {
    static func top(ofView: UIView, toView: UIView, toAttribute: NSLayoutAttribute = .top, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .top, relatedBy: .equal,
            toItem: toView, attribute: toAttribute, multiplier: multiplier, constant: constant)
        return x
    }
    static func bottom(ofView: UIView, toView: UIView, toAttribute: NSLayoutAttribute = .bottom, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .bottom, relatedBy: .equal,
            toItem: toView, attribute: toAttribute, multiplier: multiplier, constant: constant)
        return x
    }
    
    static func left(ofView: UIView, toView: UIView, toAttribute: NSLayoutAttribute = .left, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .left, relatedBy: .equal,
            toItem: toView, attribute: toAttribute, multiplier: multiplier, constant: constant)
        return x
    }
    
    static func right(ofView: UIView, toView: UIView, toAttribute: NSLayoutAttribute = .right, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .right, relatedBy: .equal,
            toItem: toView, attribute: toAttribute, multiplier: multiplier, constant: constant)
        return x
    }
    
    static func leftMargin(ofView: UIView, toView: UIView) -> NSLayoutConstraint {
        let margins = toView.layoutMarginsGuide
        return ofView.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    }
    
    static func rightMargin(ofView: UIView, toView: UIView) -> NSLayoutConstraint {
        let margins = toView.layoutMarginsGuide
        return ofView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    }
    
    static func topMargin(ofView: UIView, toView: UIView) -> NSLayoutConstraint {
        let margins = toView.layoutMarginsGuide
        return ofView.topAnchor.constraint(equalTo: margins.topAnchor)
    }
    
    static func bottomMargin(ofView: UIView, toView: UIView) -> NSLayoutConstraint {
        let margins = toView.layoutMarginsGuide
        return ofView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
    }
    
    static func height(ofView: UIView, constant: CGFloat, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .height, relatedBy: .equal,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: multiplier, constant: constant)
        
        return x
    }
    
    static func minHeight(ofView: UIView, constant: CGFloat, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .height, relatedBy: .greaterThanOrEqual,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: multiplier, constant: constant)
        
        return x
    }
    
    static func maxHeight(ofView: UIView, constant: CGFloat, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .height, relatedBy: .lessThanOrEqual,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: multiplier, constant: constant)
        
        return x
    }
    
    static func width(ofView: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let x = NSLayoutConstraint(
            item: ofView, attribute: .width, relatedBy: .equal,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: multiplier, constant: constant)
        
        return x
    }
    
    static func heightBy(ofView: UIView, toView: UIView, toAttribute: NSLayoutAttribute = .height, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: ofView, attribute: .height, relatedBy: .equal,
            toItem: toView, attribute: toAttribute, multiplier: multiplier, constant: constant)
    }
    
    static func widthBy(ofView: UIView, toView: UIView, toAttribute: NSLayoutAttribute = .width, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: ofView, attribute: .width, relatedBy: .equal,
            toItem: toView, attribute: toAttribute, multiplier: multiplier, constant: constant)
    }
    
    static func centerX(ofView: UIView, toView: UIView, onAttribute: NSLayoutAttribute = .centerX, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: ofView, attribute: .centerX, relatedBy: .equal,
            toItem: toView, attribute: onAttribute, multiplier: 1.0, constant: 0)
    }
    
    static func centerY(ofView: UIView, toView: UIView, onAttribute: NSLayoutAttribute = .centerY, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: ofView, attribute: .centerY, relatedBy: .equal,
            toItem: toView, attribute: onAttribute, multiplier: 1.0, constant: 0)
    }
    
    static func below(view: UIView, toView: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint.top(ofView: view, toView: toView, toAttribute: .bottom, multiplier: multiplier, constant: constant)
    }
    
    static func above(view:UIView, toView: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint.bottom (ofView: view, toView: toView, toAttribute: .top, multiplier: multiplier, constant: constant)
    }
    
    static func visual(views: [String: UIView], format: String, options: NSLayoutFormatOptions = NSLayoutFormatOptions(rawValue: 0), metrics: [String: Any]? = nil) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: metrics, views: views)
    }
    
    static func fill(ofView: UIView, toView: UIView) -> [NSLayoutConstraint] {
        return [
            NSLayoutConstraint.top   (ofView: ofView, toView: toView),
            NSLayoutConstraint.bottom(ofView: ofView, toView: toView),
            NSLayoutConstraint.left  (ofView: ofView, toView: toView),
            NSLayoutConstraint.right (ofView: ofView, toView: toView)
        ]
    }
    
    static func fillBelow(ofView: UIView, toView: UIView, belowView: UIView) -> [NSLayoutConstraint] {
        return [
            NSLayoutConstraint.top   (ofView: ofView, toView: belowView),
            NSLayoutConstraint.bottom(ofView: ofView, toView: toView),
            NSLayoutConstraint.left  (ofView: ofView, toView: toView),
            NSLayoutConstraint.right (ofView: ofView, toView: toView)
        ]
    }
    
    static func bindToBottom(ofView: UIView, toView: UIView, height: CGFloat) -> [NSLayoutConstraint] {
        return [
            NSLayoutConstraint.height(ofView: ofView, constant: height),
            NSLayoutConstraint.bottom(ofView: ofView, toView: toView),
            NSLayoutConstraint.left  (ofView: ofView, toView: toView),
            NSLayoutConstraint.right (ofView: ofView, toView: toView)
        ]
    }
    
    static func bindToTop(ofView: UIView, toView: UIView, height: CGFloat) -> [NSLayoutConstraint] {
        return [
            NSLayoutConstraint.height(ofView: ofView, constant: height),
            NSLayoutConstraint.top(ofView: ofView, toView: toView),
            NSLayoutConstraint.left  (ofView: ofView, toView: toView),
            NSLayoutConstraint.right (ofView: ofView, toView: toView)
        ]
    }
    
    static func field(_ fieldView: UIView, parentView: UIView, belowView: UIView, padding: CGFloat = 8, height: CGFloat = 30, isTop: Bool = false) -> [NSLayoutConstraint] {
        let topConstraint = isTop ?
            NSLayoutConstraint.top(ofView: fieldView, toView: parentView) :
            NSLayoutConstraint.below(view: fieldView, toView: belowView, constant: padding)
        
        return [
            topConstraint,
            NSLayoutConstraint.height(ofView: fieldView, constant: 30),
            NSLayoutConstraint.leftMargin(ofView: fieldView, toView: parentView),
            NSLayoutConstraint.rightMargin(ofView: fieldView, toView: parentView),
            
        ]
    }
    
}
