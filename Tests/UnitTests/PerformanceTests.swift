//
//  PerformanceTests.swift
//  SwiftySynchronizedTests
//
//  Created by Никита Васильев on 05.06.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import Foundation
import XCTest

@testable import SwiftySynchronized

final class PerformanceTests: XCTestCase {
    func testMutexPerformance() {
        measure {
            run(strategy: MutexLock())
        }
    }
    
    func testSpinLockPerformance() {
        measure {
            run(strategy: SpinLock())
        }
    }
    
    func testDispathQueuePerformance() {
        measure {
            run(strategy: DispatchQueue(label: "com.synhronized"))
        }
    }
    
    func testDispathSemaphorePerformance() {
        measure {
            run(strategy: DispatchSemaphore(value: 1))
        }
    }
    
    func testLockPerformance() {
        measure {
            run(strategy: NSLock())
        }
    }
    
    func testReadWriteLockPerformance() {
        measure {
            run(strategy: ReadWriteLock())
        }
    }
    
    func testRWQueuePerformance() {
        measure {
            run(strategy: RWQueue())
        }
    }
    
    func testUnfairLockPerfomance() {
        measure {
            run(strategy: UnfairLock())
        }
    }
    
    func run(strategy: Locable) {
        let count = Synchronized(value: 0, lock: strategy)
        let numIterations = 100_000
        let group = DispatchGroup()
        
        for _ in 0..<numIterations {
            group.enter()
            
            DispatchQueue.global().async {
                count.update { count in
                    let original = count
                    usleep(10)
                    count = original + 1
                }
                group.leave()
            }
        }
        
        group.wait()
        
        XCTAssertEqual(count.get(), numIterations, "Should have gotten all counts")
    }
}
