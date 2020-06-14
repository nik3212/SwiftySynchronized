//
//  NSLock+.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 22.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

extension NSLock: Locable {
    public func read<T>(_ block: () throws -> T) rethrows -> T {
        self.lock()
        defer { self.unlock() }
        return try block()
    }
    
    public func write<T>(_ block: () throws -> T) rethrows -> T {
        self.lock()
        defer { self.unlock() }
        return try block()
    }
}
