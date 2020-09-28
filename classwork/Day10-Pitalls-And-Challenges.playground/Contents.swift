import UIKit

//var array = [Int]()
//let lock = NSLock()
//
//DispatchQueue.concurrentPerform(iterations: 100) { index in
//    lock.lock()
//    defer { lock.unlock() }
//    let last = array.last ?? 0
//    array.append(last + 1)
//    print(array)
//}



protocol Question {
    var id: String { get }
    var question: String { get }
    mutating func adjustAnswer(answer: Bool)
}

enum QuestionType {

    case painWhenSwallowing(Bool), fever(Bool), coughingOrCongestion(Bool), soreThroat(Bool), swollenThroat(Bool), sandpaperRash(Bool), abdominalPain(Bool), headache(Bool), earPain(Bool), exposureToSick(Bool)
    
    init(questionKey: String, answer: Bool = false) {
        switch questionKey {
        case "painWhenSwallowing":
            self = .painWhenSwallowing(answer)
        case "fever":
            self = .fever(answer)
        case "coughingOrCongestion":
            self = .coughingOrCongestion(answer)
        case "soreThroat":
            self = .soreThroat(false)
        case "swollenThroat":
            self = .swollenThroat(false)
        case "sandpaperRash":
            self = .sandpaperRash(false)
        case "abdominalPain":
            self = .abdominalPain(false)
        case "headache":
            self = .headache(false)
        case "earPain":
            self = .earPain(false)
        case "exposureToSick":
            self = .exposureToSick(false)
        default:
            fatalError("Unsupported question key \(questionKey)")
        }
    }
}

extension QuestionType: Question {
    var id: String {
        switch self {
        case .painWhenSwallowing:
            return "painWhenSwallowing"
        case .fever:
            return "fever"
        case .coughingOrCongestion:
            return "coughingOrCongestion"
        case .soreThroat:
            return "soreThroat"
        case .swollenThroat:
            return "swollenThroat"
        case .sandpaperRash:
            return "sandpaperRash"
        case .abdominalPain:
            return "abdominalPain"
        case .headache:
            return "headache"
        case .earPain:
            return "earPain"
        case .exposureToSick:
            return "exposureToSick"
        }
    }
    var question: String {
        switch self {
        case .painWhenSwallowing:
            return "Is the patient experiencing pain when swallowing?"
        case .fever:
            return "Does the patient have a fever over 102F?"
        case .coughingOrCongestion:
            return "Is the patient coughing or congested?"
        case .soreThroat:
            return "Does the patient have a sore throat?"
        case .swollenThroat:
            return "Is the front of the patient's neck swollen (lymph nodes)?"
        case .sandpaperRash:
            return "Does the patient have a rash on their nose, neck, chest, or stomach?"
        case .abdominalPain:
            return "Is the patient experiencing  abdominal pain?"
        case .headache:
            return "Does the patient have a headache?"
        case .earPain:
            return "Is the patient experiencing ear pain?"
        case .exposureToSick:
            return "Has the patient been exposed to others with strep?"
        }
    }
    
    mutating func adjustAnswer(answer: Bool) {
        switch self {
        case .painWhenSwallowing(let oldAnswer):
            print("Old answer \(oldAnswer) not needed")
            self = .painWhenSwallowing(answer)
        case .fever:
            self = .fever(answer)
        case .coughingOrCongestion:
            self = .coughingOrCongestion(answer)
        case .soreThroat:
            self = .soreThroat(answer)
        case .swollenThroat:
            self = .swollenThroat(answer)
        case .sandpaperRash:
            self = .sandpaperRash(answer)
        case .abdominalPain:
            self = .abdominalPain(answer)
        case .headache:
            self = .headache(answer)
        case .earPain:
            self = .earPain(answer)
        case .exposureToSick:
            self = .exposureToSick(answer)
        }
    }
}


//creating questions
var question1: Question = QuestionType(questionKey: "earPain")
print(question1)
question1.adjustAnswer(answer: true)
print(question1)

//loading questions from database
let questionsDictionary: [String: Bool] = ["earPain": true, "fever": false]
var questionsArray: [Question] = []
for item in questionsDictionary {
    print(item)
    let question = QuestionType(questionKey: item.key, answer: item.value)
    questionsArray.append(question)
}
print(questionsArray)
