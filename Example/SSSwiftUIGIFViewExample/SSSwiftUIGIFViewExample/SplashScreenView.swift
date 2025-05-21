//
//  SplashScreenView.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 07/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var lunchHomeView: Bool = false
    
    var body: some View {
        if self.lunchHomeView {
            DemoView()
        } else {
            VStack {
                Text("SSSwiftUIGIFView")
                    .font(.largeTitle)
                    .bold()
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.lunchHomeView = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
//
//struct DemoView: View {
//    @State var pushDemoView = false
//    
//    var body: some View {
//        NavigationStack {
//            Button("Next Page") {
//                pushDemoView = true
//            }
//            .navigationDestination(isPresented: $pushDemoView, destination: {
//                ContentView()
//                    .navigationBarBackButtonHidden(true)
//            })
//        }
//    }
//}

import SwiftUI

struct DemoView: View {
    @State private var showSwiftUIView = false

    var body: some View {
        VStack(spacing: 20) {
            // SwiftUI Navigation Button
            NavigationStack {
                Button("Go to SwiftUI View") {
                    showSwiftUIView = true
                }
                .navigationDestination(isPresented: $showSwiftUIView) {
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                }
            }

            // UIKit Presentation Button
            Button("Present UIKit View Controller") {
                presentUIKitViewController()
            }
            .padding()
        }
    }

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
}



import SwiftUI
import UIKit

struct ViewControllerPresenter: UIViewControllerRepresentable {
    let viewControllerProvider: () -> UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController() // A placeholder
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Present only once
        if uiViewController.presentedViewController == nil {
            let vc = viewControllerProvider()
            uiViewController.present(vc, animated: true, completion: nil)
        }
    }
}
