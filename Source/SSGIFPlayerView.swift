//
//  GIFCache.swift
//  SSSwiftUIGIFView
//
//  Created by Yagnik Bavishi on 19/05/25.
//

import UIKit
import SwiftUI

@objc(GIFPlayerContainerView)
public class GIFPlayerContainerView: UIView {
    private var hostingController: UIHostingController<AnyView>?

    public func loadGif(from urlString: String, isShowProgressView: Bool = false) {
        guard let url = URL(string: urlString) else { return }
        let gifView = SwiftUIGIFPlayerView(gifURL: url, isShowProgressView: isShowProgressView)
        embedSwiftUIView(AnyView(gifView))
    }

    public func loadGif(named name: String, isShowProgressView: Bool = false) {
        let gifView = SwiftUIGIFPlayerView(gifName: name, isShowProgressView: isShowProgressView)
        embedSwiftUIView(AnyView(gifView))
    }

    private func embedSwiftUIView(_ swiftUIView: AnyView) {
        hostingController?.view.removeFromSuperview()
        hostingController = nil

        let controller = UIHostingController(rootView: swiftUIView)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear

        addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            controller.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        hostingController = controller
    }
}
