//
//  Home.swift
//  Kindful
//
//  Created by Shaurya Gupta on 2023-02-18.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    @State var showPopup = false
    var body: some View {
        TabView {
            Donate()
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house.fill")
                    }
                    
                }
            
            Message()
                .tabItem {
                    Label {
                        Text("Notification")
                    } icon: {
                        Image(systemName: "bubble.left.fill")
                        
                    }
                    
                }
            
            Button {
                showPopup = true
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.forward.fill")
            }
            .tabItem {
                Label {
                    Text("Log Out").onTapGesture {
                        showPopup = true
                    }
                } icon: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward.fill").onTapGesture {
                        showPopup = true
                    }
                }
            }
            .alert("Log Out?", isPresented: $showPopup) {
                Button("Yes", role: .destructive) {
                    do {
                       try withAnimation(.easeOut) {
                            try Auth.auth().signOut()
                            Login().isLoggedIn.toggle()
                        }
                    } catch {
                        print("Error signing out")
                    }
                }
                Button("No", role: .cancel) {
                    
                }
            }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
