//
//  SwiftUIView.swift
//  SSSwiftUIGIFView
//
//  Created by Vatsal Tanna on 07/01/20.
//

import SwiftUI

public struct GIFView: UIViewRepresentable {
    
    private var gifName: String
    
    public init(gifName: String) {
        self.gifName = gifName
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GIFView>) {
        
    }
    
    public func makeUIView(context: Context) -> UIView {
        return GIFPlayerView(gifName: gifName)
    }
    
}
