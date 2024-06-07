//
//  PlayerView.swift
//  SwiftUI-Demo
//
//  Created by Testing on 12/09/19.
//  Copyright © 2019 Testing. All rights reserved.
//

import WebKit
import SwiftUI

public struct GIFPlayerView: UIViewRepresentable {
    
    // MARK: - Variables
    let gifData: Data
    
    /// This function is called by SwiftUI to create a new WKWebView instance.
    ///
    /// - Parameter context: The context provided by SwiftUI, which contains information about the current state of the view.
    /// - Returns: A configured WKWebView instance for displaying the GIF.
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
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
