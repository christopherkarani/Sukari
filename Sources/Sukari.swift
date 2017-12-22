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
    
    /**
     *  set(_:) lets you Swiftly 'set' values to your objects.
     *
     *  This method will return 'Self' which woulf be the conforming object
     *
     *  - parameter object: A copy closure, returns a copy of the value object with set properties
     *
     *
     *  - return: Self
     */
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
    /**
     *  this(_:) lets you quickly and Swift Initliazie your objects.
     *
     *  This method will return 'Self' which woulf be the conforming object
     *
     *  - parameter object: A closure that allows for quick Initialization of `Self` without repition
     *
     *
     *  - return: Self
     */
    func this(_ object: Portal) rethrows -> Self {
        try object(self)
        return self
    }
    
}

// extend to any type
extension NSObject: Sukari {}
extension CGPoint: Sukari {}
extension CGRect: Sukari {}
extension CGSize: Sukari {}
extension CGVector: Sukari {}

#if os(iOS) || os(tvOS)
    extension UIEdgeInsets: Sukari {}
    extension UIOffset: Sukari {}
    extension UIRectEdge: Sukari {}
#endif
