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
protocol Sukari {
    typealias Portal = (Self) throws  -> Void
    typealias ValuePortal = (inout Self) throws  -> Void
}

extension Sukari where Self: Any {

    func set(_ object: ValuePortal) rethrows -> Self {
        var copy = self
        try object(&copy)
        return copy
    }
    
    func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

extension Sukari where Self: NSObject {
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
