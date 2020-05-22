//
//  ReadWriteLock.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 22.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

/// A read-write thread lock.
final class ReadWriteLock {
    
    // MARK: Private Properties
    
    /// RWLock.
    private var lock = pthread_rwlock_t()
    
    /// Attributes.
    private var attr = pthread_rwlockattr_t()
    
    // MARK: Initialization
    
    /// Create a new `ReadWriteLock` instance.
    init() {
        pthread_rwlock_init(&lock, &attr)
    }
    
    deinit {
        pthread_rwlock_destroy(&lock)
    }
}

// MARK: Locable
extension ReadWriteLock: Locable {
    func read<T>(_ block: () throws -> T) rethrows -> T {
        pthread_rwlock_rdlock(&lock)
        defer { pthread_rwlock_unlock(&lock) }
        return try block()
    }
    
    func write<T>(_ block: () throws -> T) rethrows -> T {
        pthread_rwlock_wrlock(&lock)
        defer { pthread_rwlock_unlock(&lock) }
        return try block()
    }
}
