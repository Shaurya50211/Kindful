//
//  Home.swift
//  Kindful
//
//  Created by Shaurya Gupta on 2023-02-18.
//

import SwiftUI

struct Home: View {
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
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
