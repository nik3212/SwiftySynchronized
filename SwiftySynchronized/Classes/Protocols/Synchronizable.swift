//
//  Synchronizable.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 15.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

protocol Synchronizable {
    associatedtype Element
    
    /// <#Description#>
    ///
    /// - Parameter block: <#block description#>
    func update(block: inout (Element) -> Void)
    
    /// <#Description#>
    ///
    /// - Parameter block: <#block description#>
    ///
    /// - Returns:
    func get() -> Element
}
