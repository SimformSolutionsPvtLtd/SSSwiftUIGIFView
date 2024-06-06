//
//  SwiftUIView.swift
//  SSSwiftUIGIFView
//
//  Created by Vatsal Tanna on 07/01/20.
//

import SwiftUI
import WebKit

public struct SwiftUIGIFPlayerView<Placeholder: View>: View {
    
    // MARK: - Variables
    @StateObject private var gifImageLoaderViewModel = GIFImageLoaderViewModel()
    private var gifURL: URL?
    private var gifName: String?
    private var isShowProgressView: Bool
    private var placeholderView: (() -> Placeholder)?
    
    /// You can also specify whether to show a progress view while the GIF is loading and provide a custom placeholder view.
    ///
    /// - Parameters:
    ///   - gifURL: An optional URL of the GIF to be loaded. If `nil`, `gifName` must be provided.
    ///   - gifName: An optional name of the GIF file located in the app's bundle. If `nil`, `gifURL` must be provided.
    ///   - isShowProgressView: A Boolean value indicating whether to show a progress view while the GIF is loading. If `true`, `placeholderView` is not required.
    ///   - placeholderView: A closure that returns a custom placeholder view to be displayed while the GIF is loading. This parameter is required if `isShowProgressView` is `false`.
    public init(gifURL: URL? = nil,
                gifName: String? = nil,
                isShowProgressView: Bool,
                @ViewBuilder placeholderView: @escaping () -> Placeholder) {
        self.gifURL = gifURL
        self.gifName = gifName
        self.isShowProgressView = isShowProgressView
        self.placeholderView = placeholderView
    }

    /// You can specify whether to show a progress view while the GIF is loading. If `isShowProgressView` is `true`.
    ///
    /// - Parameters:
    ///   - gifURL: An optional URL of the GIF to be loaded. If `nil`, `gifName` must be provided.
    ///   - gifName: An optional name of the GIF file located in the app's bundle. If `nil`, `gifURL` must be provided.
    ///   - isShowProgressView: A Boolean value indicating whether to show a progress view while the GIF is loading.
    public init(gifURL: URL? = nil,
                gifName: String? = nil,
                isShowProgressView: Bool) where Placeholder == EmptyView {
        self.gifURL = gifURL
        self.gifName = gifName
        self.isShowProgressView = isShowProgressView
        self.placeholderView = nil
    }
    
    public var body: some View {
        ZStack {
            if let gifData = gifImageLoaderViewModel.data {
                GIFPlayerView(gifData: gifData)
            } else {
                if isShowProgressView {
                    ProgressView()
                } else {
                    if let placeholderView = placeholderView {
                        placeholderView()
                    } else {
                        EmptyView()
                    }
                }
            }
        }
        .onAppear {
            loadGIF()
        }
        .onChange(of: gifName) { _ in
            loadGIF()
        }
        .onChange(of: gifURL) { _ in
            loadGIF()
        }
    }
    
    /// Loads a GIF from either a specified URL or a local file name.
    ///
    /// This function attempts to load a GIF image using the following logic:
    /// 1. If `gifURL` is provided, it uses this URL to load the GIF.
    /// 2. If `gifURL` is `nil` and `gifName` is provided, it attempts to find a file with the given name in the main bundle and load the GIF from this local file.
    public func loadGIF() {
        if let gifURL = gifURL {
            gifImageLoaderViewModel.load(url: gifURL)
        } else if let name = gifName, let url = Bundle.main.url(forResource: name, withExtension: "gif") {
            gifImageLoaderViewModel.load(url: url)
        }
    }
    
}
