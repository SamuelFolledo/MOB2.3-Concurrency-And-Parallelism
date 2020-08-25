import Foundation

let queue = DispatchQueue(label: "com.makeschool.queue")

queue.sync { //changing to async would make 🐳 not wait
    for i in 0..<10 {
        print("🍎 ", i)
    }
}

//main thread
for i in 100..<110 {
    print("🐳 ", i)
}

