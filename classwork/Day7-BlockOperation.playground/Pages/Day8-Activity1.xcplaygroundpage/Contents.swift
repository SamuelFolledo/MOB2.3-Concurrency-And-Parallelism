

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Queue
let operationQueue = OperationQueue()
operationQueue.qualityOfService = .userInitiated
//operationQueue.maxConcurrentOperationCount = 1 //1 makes it in order


class MyOperation: Operation {
    var identifier: Int!
    
    //TODO: Create main()
    override func main() {
        print("Operation \(identifier!) started")
    }
}

let myOp = MyOperation()
myOp.identifier = 1

let secondOp = MyOperation()
secondOp.identifier = 2

let thirdOp = MyOperation()
thirdOp.identifier = 3

myOp.completionBlock = {
    //TODO: print "MyOp Completed"
    print("MyOp 1 Completed")
}

secondOp.completionBlock = {
    //TODO: print "MyOp Completed"
    print("MyOp 2 Completed")
}

thirdOp.completionBlock = {
    //TODO: print "MyOp Completed"
    print("MyOp 3 Completed")
}

//myOp.addDependency(secondOp) //waits secondOp to be completed before starting myOp (Dependencies)
operationQueue.addOperation(myOp)
//operationQueue.waitUntilAllOperationsAreFinished() //makes it wait before adding next operation

operationQueue.addOperation(secondOp)
//operationQueue.waitUntilAllOperationsAreFinished() //makes it wait

operationQueue.addOperation(thirdOp)
//operationQueue.waitUntilAllOperationsAreFinished() //makes it wait
