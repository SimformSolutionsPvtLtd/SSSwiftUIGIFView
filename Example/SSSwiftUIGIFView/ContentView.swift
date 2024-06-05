//
//  ContentView.swift
//  SSSwiftUIGIFView
//
//  Created by Simform Solutions on 07/01/20.
//  Copyright © 2020 Simform. All rights reserved.
//

import SwiftUI
import SSSwiftUIGIFView

struct ContentView: View {
        
    var body: some View {
        VStack() {
            
            Text("Gif loaded from local machine")
                .bold()
            
            SwiftUIGIFPlayerView(name: "simformsolutions") {
                VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    Text("Loading GIF...")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.systemBackground))
            }
            .frame(width: 300, height: 300)
            
            
            Text("Gif loaded from URL")
                .bold()
            if let gifURL = URL(string: "https://media.giphy.com/media/5tkEiBCurffluctzB7/giphy.gif") {
                SwiftUIGIFPlayerView(url: gifURL, isShowProgressView: true) {
                    VStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        Text("Loading GIF...")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.systemBackground))
                }
                    .frame(width: 300, height: 300)
            } else {
                Text("Invalid URL")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
