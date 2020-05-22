//
//  Synchronized.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 15.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

public final class Synchronized<T> {
    
    // MARK: Private Properties
    
    /// <#Description#>
    private var lock: Locable
    
    /// <#Description#>
    private var value: T
    
    // MARK: Initialization
    
    /// Create a new `Synchronized` instance.
    ///
    /// - Parameters:
    ///   - value: <#value description#>
    ///   - lock: <#lock description#>
    init(value: T, lock: Locable) {
        self.lock = lock
        self.value = value
    }
}

// MARK: Synchronizable
extension Synchronized: Synchronizable {
    func update(block: inout (T) -> Void) {
        lock.write {
            block(value)
        }
    }
    
    func get() -> T {
        return lock.read {
            return value
        }
    }
}
