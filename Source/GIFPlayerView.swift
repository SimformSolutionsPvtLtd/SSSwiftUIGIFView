//
//  PlayerView.swift
//  SwiftUI-Demo
//
//  Created by Testing on 12/09/19.
//  Copyright © 2019 Testing. All rights reserved.
//

import UIKit
import WebKit
import SwiftUI

public struct GIFPlayerView: UIViewRepresentable {
    
    let data: Data
    
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.isOpaque = false
        return webView
    }
    
    public func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(data, mimeType: "image/gif", characterEncodingName: "", baseURL: URL(fileURLWithPath: ""))
    }
    
}
