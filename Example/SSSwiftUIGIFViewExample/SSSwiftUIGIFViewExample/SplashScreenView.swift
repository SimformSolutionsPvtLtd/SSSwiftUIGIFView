//
//  SplashScreenView.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 07/06/24.
//

import SwiftUI

// MARK: - SplashScreenView

struct SplashScreenView: View {
    
    @State private var launchHomeView: Bool = false
    
    var body: some View {
        if launchHomeView {
            DemoView()
        } else {
            VStack {
                Text("SSSwiftUIGIFView")
                    .font(.largeTitle)
                    .bold()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        launchHomeView = true
                    }
                }
            }
        }
    }
}

// MARK: - DemoView

struct DemoView: View {
    @State private var showSwiftUIView = false

    var body: some View {
        #if os(iOS)
        // iOS-specific layout without spacing between buttons
        NavigationStack {
            VStack {
                Text("SSSwiftUIGIFView Demo")
                    .font(.headline)
                    .padding(.top, 20)
                
                // SwiftUI Navigation Button
                Button("Go to SwiftUI View") {
                    showSwiftUIView = true
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                // UIKit Presentation Button
                Button("Present UIKit View Controller") {
                    presentUIKitViewController()
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $showSwiftUIView) {
                ContentView()
                    .navigationTitle("GIF Examples")
            }
        }
        #else
        // macOS layout - similar to iOS but adapted for macOS
        NavigationStack {
            VStack(spacing: 20) {
                Text("SSSwiftUIGIFView Demo")
                    .font(.headline)
                    .padding(.top, 20)
                
                // SwiftUI Navigation Button
                Button("Go to SwiftUI View") {
                    showSwiftUIView = true
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                // Separate button for AppKit
                Button("Present AppKit View Controller") {
                    presentMacViewController()
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
            }
            .frame(width: 300, height: 200)
            .navigationTitle("Home")
            .navigationDestination(isPresented: $showSwiftUIView) {
                ContentView()
                    .navigationTitle("GIF Examples")
            }
        }
        #endif
    }
    
    #if os(iOS)
    private func presentUIKitViewController() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else {
            return
        }

        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DemoViewController") as? UIViewController {
            vc.modalPresentationStyle = .fullScreen
            rootVC.present(vc, animated: true, completion: nil)
        }
    }
    #endif
}

// MARK: - ViewControllerPresenters for Platform-Specific Code

#if os(macOS)
import AppKit

struct ViewControllerPresenter: NSViewControllerRepresentable {
    let viewControllerProvider: () -> NSViewController

    func makeNSViewController(context: Context) -> NSViewController {
        NSViewController()
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {
        if nsViewController.presentedViewControllers?.isEmpty ?? true {
            let vc = viewControllerProvider()
            nsViewController.presentAsModalWindow(vc)
        }
    }
}
#endif

#if os(iOS)
import UIKit

struct ViewControllerPresenter: UIViewControllerRepresentable {
    let viewControllerProvider: () -> UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if uiViewController.presentedViewController == nil {
            let vc = viewControllerProvider()
            uiViewController.present(vc, animated: true, completion: nil)
        }
    }
}
#endif

// MARK: - Preview

#Preview {
    SplashScreenView()
}
