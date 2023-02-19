//
//  Donate.swift
//  Kindful
//
//  Created by Shaurya Gupta on 2023-02-18.
//

import SwiftUI
import WebKit

struct Donate: View {
    @State private var showWebView = false
    private let urlString: String = "https://donate.red.org/give/342913/?_ga=2.125558026.1296450177.1676741554-767929606.1676741553#!/donation/checkout"
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                WebView(url: URL(string: urlString)!)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct WebView : UIViewRepresentable {
    var url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
    
}
    

struct Donate_Previews: PreviewProvider {
    static var previews: some View {
        Donate()
    }
}
