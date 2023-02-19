//
//  Message.swift
//  Kindful
//
//  Created by Shaurya Gupta on 2023-02-18.
//

import SwiftUI

struct Message: View {
    @State var phoneNum = ""
    @State var noPhone = 0
    @State var sendSMS = SendSMS()
//@State var messages = ["🙏🌟 Your generous donation is making a difference and bringing hope to those in need. Thank you for your kindness and support.", "💖🌻 Your donation is helping to brighten the lives of those who need it most. Thank you for your generosity and for making a difference.", "🤗🌈 With your support, we are able to provide much-needed assistance and resources to those facing difficult times. Thank you for your donation.", "🌟👏 Your contribution is helping to create positive change in our community. Thank you for your generosity and for making a difference.", "🌻💕 Your donation is making a big impact and bringing smiles to many faces. Thank you for your kindness and support.", "🌻💕 Your donation is making a big impact and bringing smiles to many faces. Thank you for your kindness and support.", "🙌🎉 Your support is helping to make a real difference and create a brighter future for those in need. Thank you for your donation.", "🌈🌟 Your generosity is helping to spread joy and hope to those facing challenging circumstances. Thank you for your kindness and support.", "💖🙏 With your donation, we are able to provide vital resources and support to those who need it most. Thank you for your generosity.", "🤗👍 Your contribution is greatly appreciated and is helping to make a positive impact on the lives of many. Thank you for your support."]
    
    @State var message = ""
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.25)
            VStack {
//                Spacer()
                
                LottieView(fileName: "motivated")
                    .frame(width: 300, height: 300)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Motivation")
                        .foregroundColor(.black)
                    Text("Is the key to success")
                        .foregroundColor(.black.opacity(0.4))
                }
                .font(.largeTitle)
                .bold()
//                Spacer()
                TextField("Phone Number", text: $phoneNum)
                    .textContentType(.telephoneNumber)
                    .padding()
                    .frame(width: 350, height: 52)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .border(Color(.systemRed), width: CGFloat(noPhone))
                    .padding(.top, -4)
                    .padding(.leading, -10)
//                Spacer()
                Button {
                    if phoneNum != "" {
                        print("In the button press")
                        getQuote()
//                        Timer.scheduledTimer(withTimeInterval: 24 * 60 * 60, repeats: true) { _ in
                        sendSMS.doStuff(phoneNumber: phoneNum, message: "\(Login().email)" + message)
//                        }
                    } else {
                        noPhone = 2
                    }
                } label: {
                    Text("Get Motivated!")
                        .foregroundColor(.white)
                        .font(.custom("Oswald", size: 30))
                }
                .padding(.horizontal)
                .padding(.vertical)
                .background(Color.blue)
                .clipShape(Capsule())
//                Spacer()
            }
        }
    }
    
    func getQuote(){
        let parameters = "{\n  \"model\": \"text-davinci-003\",\n  \"prompt\": \"Generate a kindful aka kind and helpful quote to brighten up the day using emojis\",\n  \"temperature\": 0.6,\n  \"max_tokens\": 150,\n  \"top_p\": 1,\n  \"frequency_penalty\": 1,\n  \"presence_penalty\": 1\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://api.openai.com/v1/completions")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer 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", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let choices = json["choices"] as? [[String: Any]],
               let firstChoice = choices.first,
               let text = firstChoice["text"] as? String {
                print(text)
                message = text
            }
        }
        
        task.resume()
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
