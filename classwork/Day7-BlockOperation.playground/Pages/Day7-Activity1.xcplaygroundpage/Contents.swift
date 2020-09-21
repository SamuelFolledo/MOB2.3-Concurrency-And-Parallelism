import Foundation

let printerOperation = BlockOperation() // 1) create printerOperation as BlockOperation

// 2) add code blocks to the operation
printerOperation.addExecutionBlock { print("I") }
printerOperation.addExecutionBlock { print("am") }
printerOperation.addExecutionBlock { print("printing") }
printerOperation.addExecutionBlock { print("block") }
printerOperation.addExecutionBlock { print("operation") }

printerOperation.completionBlock = { // 3) set completion block
    print("I'm done printing")
}

let operationQueue = OperationQueue() // 4) Create an OperationQueue
operationQueue.addOperation(printerOperation) // 5) add operation to queue
