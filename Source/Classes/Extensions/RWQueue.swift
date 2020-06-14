//
//  RWQueue.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 22.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

public final class RWQueue {
    // MARK: Private Properties
    private var queue: DispatchQueue
    
    // MARK: Initialization
    public init() {
        queue = DispatchQueue(label: "com.synchronized.rwqueue", qos: .userInitiated, attributes: .concurrent)
    }
}

// MARK: Locable
extension RWQueue: Locable {
    public func read<T>(_ block: () throws -> T) rethrows -> T {
        return try queue.sync(execute: block)
    }
    
    public func write<T>(_ block: () throws -> T) rethrows -> T {
        return try queue.sync(flags: .barrier, execute: block)
    }
}
