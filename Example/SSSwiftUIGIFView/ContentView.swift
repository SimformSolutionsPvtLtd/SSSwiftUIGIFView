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
        SwiftUIGIFPlayerView(gifName: "simformsolutions")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
