//
//  DispatchQueue.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 22.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

extension DispatchQueue: Locable {
    public func read<T>(_ block: () throws -> T) rethrows -> T {
        return try self.sync(execute: block)
    }
    
    public func write<T>(_ block: () throws -> T) rethrows -> T {
        return try self.sync(execute: block)
    }
}
