//
//  TableViewCell.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 15/12/24.
//

#if os(iOS)
import UIKit
import SSSwiftUIGIFView
import Foundation

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var gifContainerView: GIFPlayerContainerView!

    func configure(gifName: String) {
        gifContainerView.loadGif(from: gifName, isShowProgressView: true)
    }
}
#endif

#if os(macOS)
import Cocoa
import SSSwiftUIGIFView

class TableViewCell: NSTableCellView {
    
    @IBOutlet weak var gifContainerView: GIFPlayerContainerView!
    private var containerView: NSView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearance()
    }
    
    private func setupAppearance() {
        wantsLayer = true
        layer?.backgroundColor = NSColor.clear.cgColor
    }
    
    func setUpContainerView(withGifView gifContainerView: GIFPlayerContainerView, cellWidth: CGFloat, cellHeight: CGFloat) {
        // Remove any existing container view
        self.containerView?.removeFromSuperview()
        
        // Create container view
        let containerView = NSView(frame: NSRect(x: 0, y: 0, width: cellWidth, height: cellHeight))
        containerView.wantsLayer = true
        containerView.layer?.backgroundColor = NSColor.clear.cgColor
        addSubview(containerView)
        
        // Layout constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Add and center GIF view
        containerView.addSubview(gifContainerView)
        gifContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gifContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            gifContainerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            gifContainerView.widthAnchor.constraint(lessThanOrEqualTo: containerView.widthAnchor, multiplier: 0.9),
            gifContainerView.heightAnchor.constraint(lessThanOrEqualTo: containerView.heightAnchor, multiplier: 0.9),
            gifContainerView.widthAnchor.constraint(equalTo: gifContainerView.heightAnchor, multiplier: 1.0)
        ])
        
        // Store references
        self.containerView = containerView
        self.gifContainerView = gifContainerView
    }

    func configure(gifName: String) {
        gifContainerView.loadGif(from: gifName, isShowProgressView: true)
    }
}
#endif
