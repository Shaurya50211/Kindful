//
//  SendSMS.swift
//  Kindful
//
//  Created by Shaurya Gupta on 2023-02-18.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct SendSMS {

    mutating func doStuff(phoneNumber: String, message: String) {
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "To=%2B1\(phoneNumber)&MessagingServiceSid=MGa2204a6069af2dd64e2e1d5bc7577b82&Body=\(message)"
        let postData =  parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.twilio.com/2010-04-01/Accounts/AC30b0f241e5ad0f51328aa8e4830a3c57/Messages.json")!,timeoutInterval: Double.infinity)
        request.addValue("Basic QUMzMGIwZjI0MWU1YWQwZjUxMzI4YWE4ZTQ4MzBhM2M1NzpmYzI2NGNkNmYyN2UxMmIzZmMyODQwYzUyYjEzYjJlNg==", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}

