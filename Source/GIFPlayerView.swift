//
//  PlayerView.swift
//  SwiftUI-Demo
//
//  Created by Testing on 12/09/19.
//  Copyright © 2019 Testing. All rights reserved.
//

import SwiftUI
import WebKit

#if os(iOS)
public struct GIFPlayerView: UIViewRepresentable {
    
    // MARK: - Variables
    let gifData: Data
    
    /// This function is called by SwiftUI to create a new WKWebView instance.
    ///
    /// - Parameter context: The context provided by SwiftUI, which contains information about the current state of the view.
    /// - Returns: A configured WKWebView instance for displaying the GIF.
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isUserInteractionEnabled = false
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.isOpaque = false
        return webView
    }
    
    /// This function is called by SwiftUI whenever the view needs to be updated.
    ///
    /// - Parameters:
    ///   - uiView: The WKWebView instance that needs to be updated.
    ///   - context: The context provided by SwiftUI, which contains information about the current state of the view.
    public func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(gifData, mimeType: "image/gif", characterEncodingName: "", baseURL: URL(fileURLWithPath: ""))
    }
    
}
#endif

#if os(macOS)
public struct GIFPlayerView: NSViewRepresentable {
    
    // MARK: - Variables
    let gifData: Data
    
    /// This function is called by SwiftUI to create a new WKWebView instance.
    ///
    /// - Parameter context: The context provided by SwiftUI, which contains information about the current state of the view.
    /// - Returns: A configured WKWebView instance for displaying the GIF.
    public func makeNSView(context: Context) -> WKWebView {
        let webView = NonInteractiveWKWebView()
        return webView
    }
    
    /// This function is called by SwiftUI whenever the view needs to be updated.
    ///
    /// - Parameters:
    ///   - uiView: The WKWebView instance that needs to be updated.
    ///   - context: The context provided by SwiftUI, which contains information about the current state of the view.
    public func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.load(gifData, mimeType: "image/gif", characterEncodingName: "", baseURL: URL(fileURLWithPath: ""))
    }
    
}

// This class is a custom subclass of WKWebView that disables user interactions.
class NonInteractiveWKWebView: WKWebView {
    override func hitTest(_ point: NSPoint) -> NSView? {
        return nil
    }
}

#endif
