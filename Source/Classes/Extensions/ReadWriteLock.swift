//
//  ReadWriteLock.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 22.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

/// A read-write thread lock.
public final class ReadWriteLock {
    
    // MARK: Private Properties
    
    /// RWLock.
    private var lock = pthread_rwlock_t()
    
    // MARK: Initialization
    
    /// Create a new `ReadWriteLock` instance.
    init() {
        pthread_rwlock_init(&lock, nil)
    }
    
    deinit {
        pthread_rwlock_destroy(&lock)
    }
}

// MARK: Locable
extension ReadWriteLock: Locable {
    public func read<T>(_ block: () throws -> T) rethrows -> T {
        pthread_rwlock_rdlock(&lock)
        defer { pthread_rwlock_unlock(&lock) }
        return try block()
    }
    
    public func write<T>(_ block: () throws -> T) rethrows -> T {
        pthread_rwlock_wrlock(&lock)
        defer { pthread_rwlock_unlock(&lock) }
        return try block()
    }
}
