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
    @State var messages = ["🙏🌟 Your generous donation is making a difference and bringing hope to those in need. Thank you for your kindness and support.", "💖🌻 Your donation is helping to brighten the lives of those who need it most. Thank you for your generosity and for making a difference.", "🤗🌈 With your support, we are able to provide much-needed assistance and resources to those facing difficult times. Thank you for your donation.", "🌟👏 Your contribution is helping to create positive change in our community. Thank you for your generosity and for making a difference.", "🌻💕 Your donation is making a big impact and bringing smiles to many faces. Thank you for your kindness and support.", "🌻💕 Your donation is making a big impact and bringing smiles to many faces. Thank you for your kindness and support.", "🙌🎉 Your support is helping to make a real difference and create a brighter future for those in need. Thank you for your donation.", "🌈🌟 Your generosity is helping to spread joy and hope to those facing challenging circumstances. Thank you for your kindness and support.", "💖🙏 With your donation, we are able to provide vital resources and support to those who need it most. Thank you for your generosity.", "🤗👍 Your contribution is greatly appreciated and is helping to make a positive impact on the lives of many. Thank you for your support."]
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.25)
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Motivation")
                        .foregroundColor(.black)
                    Text("Is the key to success")
                        .foregroundColor(.black.opacity(0.4))
                }
                .font(.largeTitle)
                .bold()
                Spacer()
                TextField("Phone Number", text: $phoneNum)
                    .textContentType(.telephoneNumber)
                    .padding()
                    .frame(width: 350, height: 52)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .border(Color(.systemRed), width: CGFloat(noPhone))
                    .padding(.top, -4)
                    .padding(.leading, -10)
                Spacer()
                Button {
                    if phoneNum != "" {
                        
                        Timer.scheduledTimer(withTimeInterval: 24 * 60 * 60, repeats: true) { _ in
                            sendSMS.doStuff(phoneNumber: phoneNum, message: "\(ContentView().email)" + messages.randomElement()!)
                        }
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
                Spacer()
            }
        }
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
