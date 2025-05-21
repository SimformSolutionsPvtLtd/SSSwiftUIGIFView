//
//  ContentView.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 07/06/24.
//

import SwiftUI
import SSSwiftUIGIFView

struct ContentView: View {
    
    let gifURLs: [String] = [
        "https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
                "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
                "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
                "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
                "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
        "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
        "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
        "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
        "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
        "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
        "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif","https://media.giphy.com/media/3ohze3Etu7mUfkHkI0/giphy.gif",
        "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia_logo_puzzle_globe_spins_horizontally_and_vertically%2C_revealing_the_contents_of_all_of_its_puzzle_pieces%2C_without_background.gif",
        "https://upload.wikimedia.org/wikipedia/commons/5/55/8-cell-simple.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/29/Injector3.gif",
        "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"            ]
            
    let gifNames = Array(repeating: "simformsolutions", count: 200)

    
            var body: some View {
                List(gifURLs, id: \.self) { url in

                    SwiftUIGIFPlayerView(gifURL: URL(string:url), isShowProgressView: true)
                        .aspectRatio(contentMode: .fit)// Adjust the height as needed
                        .frame(width: 300, height: 250)
                }
                
//                List(gifNames.indices, id: \.self) { index in
//                            SwiftUIGIFPlayerView(gifName: gifNames[index], isShowProgressView: false)
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 300, height: 250)
//                        }
                
                .navigationBarBackButtonHidden(true)

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
        #if os(iOS)
        .background(Color(UIColor.systemBackground))
        #elseif os(iOS)
        .background(Color(nsColor: NSColor.windowBackgroundColor))
        #endif
    }
}
#Preview {
    ContentView()
}
