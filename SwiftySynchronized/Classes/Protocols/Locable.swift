//
//  Synchronized.swift
//  SwiftySynchronized
//
//  Created by Никита Васильев on 15.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation

public protocol Locable {
    func read<T>(_ block: () throws -> T) rethrows -> T
    func write<T>(_ block: () throws -> T) rethrows -> T
}
