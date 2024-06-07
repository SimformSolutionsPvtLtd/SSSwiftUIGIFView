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
    @StateObject private var gifImageViewModel = GIFImageViewModel()
    private var gifURL: URL?
    private var gifName: String?
    private var isShowProgressView: Bool? = false
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
                isShowProgressView: Bool? = false,
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
                isShowProgressView: Bool? = false) where Placeholder == EmptyView {
        self.gifURL = gifURL
        self.gifName = gifName
        self.isShowProgressView = isShowProgressView
        self.placeholderView = nil
    }
    
    public var body: some View {
        ZStack {
            if let gifData = gifImageViewModel.data {
                GIFPlayerView(gifData: gifData)
            } else {
                if let isShowProgressView = isShowProgressView, isShowProgressView {
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
        .onChange(of: gifURL) { newURL in
            loadGIF(url: newURL, name: gifName)
        }
        .onChange(of: gifName) { newName in
            loadGIF(url: gifURL, name: newName)
        }
    }
    
    /// Loads a GIF from either a specified URL or a local file name.
    /// - Parameters:
    ///   - url: An optional URL of the GIF to be loaded. If provided, this URL will be used to load the GIF.
    ///   - name: An optional name of the GIF file located in the app's bundle. If provided and `url` is `nil`, this name will be used to load the GIF.
    public func loadGIF(url: URL? = nil, name: String? = nil) {
        if let gifURL = url ?? self.gifURL {
            gifImageViewModel.load(url: gifURL)
        } else if let gifName = name ?? self.gifName {
            gifImageViewModel.load(name: gifName)
        }
    }
    
}
