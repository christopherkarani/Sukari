//
//  Sukari.swift
//  Sugar
//
//  Created by Christopher Brandon Karani on 17/12/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import Foundation
import CoreGraphics


#if os(iOS) || os(tvOS)
    import UIKit.UIGeometry
#endif

// Sukari 🍯
// Beatuful syntactic enhancement
public protocol Sukari {
    typealias Portal = (Self) throws  -> Void
    typealias ValuePortal = (inout Self) throws  -> Void
}

public extension Sukari where Self: Any {

    func set(_ object: ValuePortal) rethrows -> Self {
        var copy = self
        try object(&copy)
        return copy
    }
    
    func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

public extension Sukari where Self: NSObject {
    func this(_ object: Portal) rethrows -> Self {
        try object(self)
        return self
    }
    
}

// extend to any type
public extension NSObject: Sukari {}
public extension CGPoint: Sukari {}
public extension CGRect: Sukari {}
public extension CGSize: Sukari {}
public extension CGVector: Sukari {}

#if os(iOS) || os(tvOS)
    public extension UIEdgeInsets: Sukari {}
    public extension UIOffset: Sukari {}
    public extension UIRectEdge: Sukari {}
#endif
