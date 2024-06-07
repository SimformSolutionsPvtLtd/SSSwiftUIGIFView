//
//  SwiftUIView.swift
//  SSSwiftUIGIFView
//
//  Created by Vatsal Tanna on 07/01/20.
//

import SwiftUI

public struct SwiftUIGIFPlayerView: UIViewRepresentable {
    
    private var gifName: String?
    private var gifURL: URL?
    
    public init(gifName: String) {
        self.gifName = gifName
    }
    
    public init(gifURL: URL) {
        self.gifURL = gifURL
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SwiftUIGIFPlayerView>) {
        guard let gifPlayerView = uiView as? GIFPlayerView else { return }
        if let gifName = gifName {
            gifPlayerView.updateGIF(gifName: gifName)
        } else if let gifURL = gifURL {
            gifPlayerView.updateGIFURL(gifURL: gifURL)
        }
    }
    
    public func makeUIView(context: Context) -> UIView {
        if let gifURL = gifURL {
            return GIFPlayerView(gifURL: gifURL)
        } else if let gifName = gifName {
            return GIFPlayerView(gifName: gifName)
        } else {
            return UIView()
        }
    }
    
}
