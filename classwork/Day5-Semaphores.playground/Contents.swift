import UIKit

//Activity 1
//let semaphore = DispatchSemaphore(value: 1)
//DispatchQueue.global().async {
//    print("Person 1 - wait")
//    semaphore.wait()
//    print("Person 1 - wait finished")
//    sleep(1) // Person 1 playing with Switch
//    print("Person 1 - done with Switch")
//    semaphore.signal()
//}
//
//DispatchQueue.global().async {
//    print("Person 2 - wait")
//    semaphore.wait()
//    print("Person 2 - wait finished")
//    sleep(1) // Person 2 playing with Switch
//    print("Person 2 - done with Switch")
//    semaphore.signal()
//}
//
//DispatchQueue.global().async {
//    print("Person 3 - wait")
//    semaphore.wait()
//    print("Person 3 - wait finished")
//    sleep(1) // Person 2 playing with Switch
//    print("Person 3 - done with Switch")
//    semaphore.signal()
//}


//Activity 2

func downloadMovies(numberOfMovies: Int) {
    // Create a semaphore
    let semaphore = DispatchSemaphore(value: numberOfMovies - 1)
    // Launch 8 tasks
    for i in 0 ..< 8 {
        // Each task should wait (pretend downloading takes 2 seconds) and inform the console once it's done.
        // Run the tasks on a background thread.
        print("Doing: \(i)")
        let queue = DispatchQueue(label: "com.makeschool.queue1", qos: .background)
        queue.async {
            Thread.sleep(forTimeInterval: 2)
            print("Finished downloading: \(i) : \(Date())")
            // Let the semaphore know when you release the resource
            semaphore.signal()
        }
        semaphore.wait()
    }
}

downloadMovies(numberOfMovies: 2)
