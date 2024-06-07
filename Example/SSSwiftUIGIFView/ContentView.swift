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
            SwiftUIGIFPlayerView(gifName: "simformsolutions", isShowProgressView: true)
                .frame(width: 200, height: 200)
            
            Text("Gif loaded from URL")
                .bold()
            if let gifURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif") {
                SwiftUIGIFPlayerView(gifURL: gifURL) {
                    customPlaceHolderView
                }
                .frame(width: 300, height: 300)
            } else {
                Text("Invalid URL")
            }
        }
    }
}

// MARK: - Subviews
extension ContentView {
    private var customPlaceHolderView: some View {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
