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
            SwiftUIGIFPlayerView(gifName: "simformsolutions")
                .frame(width: 300, height: 300)
            
            Text("Gif loaded from URL")
                .bold()
            if let gifURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif") {
                SwiftUIGIFPlayerView(gifURL: gifURL)
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
