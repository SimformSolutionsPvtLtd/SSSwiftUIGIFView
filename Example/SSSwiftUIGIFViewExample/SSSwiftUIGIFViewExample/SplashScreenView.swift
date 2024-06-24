//
//  SplashScreenView.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 07/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var lunchHomeView: Bool = false
    
    var body: some View {
        if self.lunchHomeView {
            ContentView()
        } else {
            VStack {
                Text("SSSwiftUIGIFView")
                    .font(.largeTitle)
                    .bold()
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.lunchHomeView = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
