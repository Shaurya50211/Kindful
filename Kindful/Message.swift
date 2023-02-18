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
                        sendSMS.doStuff(phoneNumber: phoneNum, message: "C'mon C'mon GET THAT ")
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
