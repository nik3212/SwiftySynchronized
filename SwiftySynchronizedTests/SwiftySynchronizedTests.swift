//
//  SwiftySynchronizedTests.swift
//  SwiftySynchronizedTests
//
//  Created by Никита Васильев on 15.05.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import XCTest
@testable import SwiftySynchronized

class SynchronizedTests: XCTestCase {
    
    func testThatMutexSynchronizedHasNotProblems() {
        run(strategy: MutexLock())
    }

    func testThatSpinLockSynhronizedHasNotProblems() {
        run(strategy: SpinLock())
    }
    
    func testThatDispathQueueSynhronizedHasNotProblems() {
        run(strategy: DispatchQueue(label: "com.synhronized"))
    }
    
    func testThatDispathSemaphoreSynchronizedHasNotProblems() {
        run(strategy: DispatchSemaphore(value: 1))
    }
    
    func testThatLockSynchronizedHasNotProblens() {
        run(strategy: NSLock())
    }
    
    func testThatReadWriteLockSynchronizedHasNotProblems() {
        run(strategy: ReadWriteLock())
    }
    
    func testThatRWQueueSynchronizedHasNotProblems() {
        run(strategy: RWQueue())
    }
    
    func testThatUnfairLockSynhronizedHasNotProblems() {
        run(strategy: UnfairLock())
    }
    
    func testThatConcurrentMutationWithoutSynhronizedHasProblems() {
        var count = 0
        let numIterations = 100
        let group = DispatchGroup()
        
        for _ in 0..<numIterations {
            group.enter()
            
            DispatchQueue.global().async {
                let original = count
                usleep(10)
                count = original + 1
            }
            group.leave()
        }
        
        group.wait()
        
        XCTAssertLessThan(count, numIterations, "Should have gotten all counts")
    }
    
    func run(strategy: Locable) {
        let count = Synchronized(value: 0, lock: strategy)
        let numIterations = 100
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
