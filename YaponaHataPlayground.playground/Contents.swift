import UIKit
import Foundation
import SwiftSoup
import PlaygroundSupport

enum ScraperResult: Error {
    case success(String)
    case failure(Error)
}

enum ScraperError: Error {
    case dataFromatError
}

let semaphore = DispatchSemaphore(value: 0)

func scrapWebsite(from url: URL, completionHandler completion: @escaping (ScraperResult)->Void) {
    
    let urlRequest = URLRequest(url: url)
    
    let dataTask = URLSession.shared.dataTask(with: urlRequest) {
        data, response, error in
        defer {
            semaphore.signal()
        }
        
        if let data = data {
            guard let html = String(data: data, encoding: String.Encoding.windowsCP1251) else {
                completion(.failure(ScraperError.dataFromatError))
                return
            }
            
            do {
                var text = ""
                
                let doc: Document = try SwiftSoup.parse(html)
                let menu = try doc.getElementsByClass("section-select")
                let menuSections = menu.array()
                for section in menuSections {
                    text += " \(try section.text())"
                    let sectionLink = try section.tagName("a").attr("href")
                    text += ", \(sectionLink)\n"
                }
               
                completion(.success(text))
            } catch {
                completion(.failure(error))
            }
        } else if let error = error {
            completion(.failure(error))
        }
    }
    
    dataTask.resume()
}

let urlString = "http://www.xn--80aaa3cefzw9f.xn--p1ai/"
let url = URL(string: urlString)!

scrapWebsite(from: url) { result in
    switch result {
    case let .success(text):
        print(text)
    case let .failure(error):
        print(error)
    }
    
}

semaphore.wait()

