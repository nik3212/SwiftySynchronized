//
//  UnfairLock.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 05.06.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

public class UnfairLock {
    // MARK: Private Properties

    private var lock = os_unfair_lock()
}

// MARK: Locable
extension UnfairLock: Locable {
    func read<T>(_ block: () throws -> T) rethrows -> T {
        os_unfair_lock_lock(&lock)
        defer { os_unfair_lock_unlock(&lock) }
        return try block()
    }
    
    func write<T>(_ block: () throws -> T) rethrows -> T {
        os_unfair_lock_lock(&lock)
        defer { os_unfair_lock_unlock(&lock) }
        return try block()
    }
}
