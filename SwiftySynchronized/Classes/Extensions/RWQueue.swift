//
//  RWQueue.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 22.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

final class RWQueue {
    // MARK: Private Properties
    private var queue = DispatchQueue(label: "com.synchronized.rwqueue", qos: .userInitiated, attributes: .concurrent)
}

// MARK: Locable
extension RWQueue: Locable {
    func read<T>(_ block: () throws -> T) rethrows -> T {
        return try queue.sync(execute: block)
    }
    
    func write<T>(_ block: () throws -> T) rethrows -> T {
        return try queue.sync(execute: block)
    }
}
