
import SwiftUI



struct APIQuestion: Codable {
    //var id = UUID()
    var question: String
    var options: [APIOption]
}

struct Question: Codable {
    var id = UUID()
    var question: String
    var options: [Option]
}

struct APIOption: Codable {
    //var id = UUID()
    var name: String
    var correctOption: Bool
    var optionTouched: Bool? = true
}

struct Option: Codable {
    var id = UUID()
    var name: String
    var correctOption: Bool
    var optionTouched:Bool
}

struct Results: Codable {
    var results: [APIQuestion]
}


let url = URL(string: "https://www.footyquiz.io/api/v1/questions/random")!

var request = URLRequest(url: url)
request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
request.httpMethod = "GET"

var session = URLSession.shared


var options = [Option]()
var questions = [Question]()
let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
    print(response!)
    do {
        if let json: Results = try! JSONDecoder().decode(Results.self, from: data!) {
            json.results.forEach { APIQuestion in
                APIQuestion.options.forEach { APIOption in
                     options.append(Option.init(id: UUID(), name: APIOption.name, correctOption: APIOption.correctOption, optionTouched: false))
                }
                questions.append(Question.init(id: UUID(), question: APIQuestion.question, options: options))
            }
        }
    } catch {
        print("error")
    }
    
})


task.resume()




