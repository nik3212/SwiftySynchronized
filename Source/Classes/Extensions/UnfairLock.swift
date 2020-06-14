//
//  UnfairLock.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 05.06.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

@available (iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *)
public class UnfairLock {
    // MARK: Private Properties

    private var lock: os_unfair_lock
    
    // MARK: Initialization
    public init() {
        self.lock = os_unfair_lock()
    }
}

// MARK: Locable
@available (iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *)
extension UnfairLock: Locable {
    public func read<T>(_ block: () throws -> T) rethrows -> T {
        os_unfair_lock_lock(&lock)
        defer { os_unfair_lock_unlock(&lock) }
        return try block()
    }
    
    public func write<T>(_ block: () throws -> T) rethrows -> T {
        os_unfair_lock_lock(&lock)
        defer { os_unfair_lock_unlock(&lock) }
        return try block()
    }
}
