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
    
    /// Get read-write access to the synchronized resource.
    ///
    /// - note: The write lock is held during the whole execution of the closure.
    func update(block: (inout Element) -> Void)
    
    /// Get resource.
    ///
    /// - Returns: Resource.
    func get() -> Element
}
