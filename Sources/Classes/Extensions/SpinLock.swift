//
//  SpinLock.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 22.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

public final class SpinLock {
    // MARK: Private Properties
    
    /// Spin lock object.
    private var lock: Int32
    
    // MARK: Initialization
    public init() {
        lock = OS_SPINLOCK_INIT
    }
}

// MARK: Locable
extension SpinLock: Locable {
    public func read<T>(_ block: () throws -> T) rethrows -> T {
        OSSpinLockLock(&lock)
        defer { OSSpinLockUnlock(&lock) }
        return try block()
    }
    
    public func write<T>(_ block: () throws -> T) rethrows -> T {
        OSSpinLockLock(&lock)
        defer { OSSpinLockUnlock(&lock) }
        return try block()
    }
}
