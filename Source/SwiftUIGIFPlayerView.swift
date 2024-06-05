//
//  SwiftUIView.swift
//  SSSwiftUIGIFView
//
//  Created by Vatsal Tanna on 07/01/20.
//

import SwiftUI
import WebKit

public struct SwiftUIGIFPlayerView<Placeholder: View>: View {
    
    @StateObject var loader = GIFImageLoader()
    var url: URL?
    var name: String?
    var isShowProgressView: Bool
    var placeholderView: Placeholder?
    
    public init(url: URL? = nil, name: String? = nil, isShowProgressView: Bool = false, @ViewBuilder placeholderView: () -> Placeholder) {
           self.url = url
           self.name = name
           self.isShowProgressView = isShowProgressView
            self.placeholderView = placeholderView()
       }
    
    public var body: some View {
        Group {
            if let data = loader.data {
                GIFPlayerView(data: data)
            } else {
                if isShowProgressView {
                    ProgressView() // Placeholder while loading
                } else {
                    placeholderView// Custom placeholder view
                }
            }
        }
        .onAppear {
            self.loadGIF()
        }
        .onChange(of: name) { newValue in
            self.loadGIF()
        }
        
        .onChange(of: url) { newValue in
            self.loadGIF()
        }
        
    }
    
    public func loadGIF() {
        if let url = url {
            loader.load(url: url)
        } else if let name = name, let url = Bundle.main.url(forResource: name, withExtension: "gif") {
            loader.load(url: url)
        }
    }
    
}
