//
//  ContentView.swift
//  SSSwiftUIGIFView
//
//  Created by Ketan Chopda on 07/01/20.
//  Copyright © 2020 Simform. All rights reserved.
//

import SwiftUI
import SSSwiftUIGIFView

struct ContentView: View {
    var body: some View {
        GIFView(gifName: "example")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
