//
//  Synchronized.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 15.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

/// Holds a value, and makes sure that it is only accessed while a lock is held.
public final class Synchronized<T> {
    
    // MARK: Private Properties
    
    /// Lock type.
    private var lock: Locable
    
    /// Value.
    private var value: T
    
    // MARK: Initialization
    
    /// Create a new `Synchronized` instance.
    ///
    /// - Parameters:
    ///   - value: Value.
    ///   - lock: Lets you choose the type of lock you want.
    init(value: T, lock: Locable) {
        self.lock = lock
        self.value = value
    }
}

// MARK: Synchronizable
extension Synchronized: Synchronizable {
    func update(block: (inout T) -> Void) {
        lock.write {
            block(&value)
        }
    }
    
    func get() -> T {
        return lock.read {
            return value
        }
    }
}
