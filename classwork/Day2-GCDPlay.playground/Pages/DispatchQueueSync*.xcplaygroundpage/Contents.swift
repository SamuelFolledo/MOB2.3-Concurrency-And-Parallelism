//: [Previous](@previous)

import Foundation
import UIKit

let queue = DispatchQueue(
    label: "sample.concurrent",
    qos: .userInitiated,
    attributes: .concurrent
)

queue.async {
    print("I am \(Thread.current) an async thread") //3
    print(45) //4
}

queue.async {
    print("I am \(Thread.current) a sync thread") //2
    Thread.sleep(forTimeInterval: 10)
    print("After sync finished sleeping for 10 seconds")
}

print("I am on the main thread - \(Thread.current)") // 1

//: [Next](@next)
