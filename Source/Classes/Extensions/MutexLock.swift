//
//  MutexLock.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 05.06.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

public final class MutexLock {
    // MARK: Private Properties
    
    /// Mutex.
    private var mutex = pthread_mutex_t()
    
    // MARK: Initialization
    
    /// Create a new `Mutex` instance.
    ///
    /// - Parameter recursive:
    public init(recursive: Bool = true) {
        var attr = pthread_mutexattr_t()
        pthread_mutexattr_settype(&attr, recursive ? PTHREAD_MUTEX_RECURSIVE : PTHREAD_MUTEX_NORMAL)
        pthread_mutex_init(&mutex, nil)
    }
}

// MARK: Locable
extension MutexLock: Locable {
    public func read<T>(_ block: () throws -> T) rethrows -> T {
        pthread_mutex_lock(&mutex)
        defer { pthread_mutex_unlock(&mutex) }
        return try block()
    }
    
    public func write<T>(_ block: () throws -> T) rethrows -> T {
        pthread_mutex_lock(&mutex)
        defer { pthread_mutex_unlock(&mutex) }
        return try block()
    }
}
