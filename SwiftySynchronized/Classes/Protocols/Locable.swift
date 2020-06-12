//
//  Synchronized.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 15.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

internal protocol Locable {
    /// Executes a closure with a read lock.
    ///
    /// - Parameter block: The block to execute while holding the lock.
    ///
    /// - Returns: The value returned by the block.
    func read<T>(_ block: () throws -> T) rethrows -> T
    
    /// Executes a closure with a write lock.
    ///
    /// - Parameter block: The block to execute while holding the lock.
    ///
    /// - Returns: The value returned by the block.
    func write<T>(_ block: () throws -> T) rethrows -> T
}
