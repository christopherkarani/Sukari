//
//  Sugar.swift
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

// Sugar 🍯
// Beatuful syntactic enhancement
protocol Sugar {
    typealias Portal = (Self) throws  -> Void
    typealias ValuePortal = (inout Self) throws  -> Void
}

extension Sugar where Self: Any {

    func set(_ object: ValuePortal) rethrows -> Self {
        var copy = self
        try object(&copy)
        return copy
    }
    
    func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

extension Sugar where Self: NSObject {
    func this(_ object: Portal) rethrows -> Self {
        try object(self)
        return self
    }
    
}

// extend to any type
extension NSObject: Sugar {}
extension CGPoint: Sugar {}
extension CGRect: Sugar {}
extension CGSize: Sugar {}
extension CGVector: Sugar {}

#if os(iOS) || os(tvOS)
    extension UIEdgeInsets: Sugar {}
    extension UIOffset: Sugar {}
    extension UIRectEdge: Sugar {}
#endif
