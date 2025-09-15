//
//  SafariWebView.swift
//  ObiletClone
//
//  Created by abdullah on 15.09.2025.
//

import SwiftUI
import WebKit

struct HelpSafariView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        }
    }
}

struct SafariWebView: View {
    let currentLink: String

    var body: some View {
        if let url = URL(string: currentLink) {
            HelpSafariView(url: url)
        }
    }
}
