//
//  Unwrapped.swift
//  Sugar
//
//  Created by Christopher Brandon Karani on 19/12/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import Foundation


public extension Optional {
    /**
     *  Unwrap this optional to contain a non-nil value
     *
     *  This method will either return the value that this optional contains, or trigger
     *  a `preconditionFailure` with an error message containing debug information.
     *
     *  - parameter hint: Optionally pass a hint that will get included in any error
     *                    message generated in case nil was found.
     *
     *  - return: The value this optional contains.
     */
    func unwrap(debug debugExpression: @autoclosure () -> String? = nil, fileName: StaticString = #file, lineNumber: UInt = #line) -> Wrapped {
        guard let unwrapped = self else {
            var message = "Unwrap value was nil in \(fileName), at line \(lineNumber)"
            
            if let debugMessage = debugExpression() {
                message.append(". Debugging message: \(debugMessage)")
            }
            
            #if !os(Linux)
                let exception = NSException(
                    name: .invalidArgumentException,
                    reason: message,
                    userInfo: nil
                )
                
                exception.raise()
            #endif
            
            preconditionFailure(message)
        }
        
        return unwrapped
    }
}
