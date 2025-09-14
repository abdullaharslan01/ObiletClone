//
//  OWebView.swift
//  ObiletClone
//
//  Created by abdullah on 13.09.2025.
//

import SafariServices
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var webView: WKWebView?

    func makeUIView(context _: Context) -> WKWebView {
        let wkWebView = WKWebView()
        DispatchQueue.main.async {
            self.webView = wkWebView
        }
        return wkWebView
    }

    func updateUIView(_ uiView: WKWebView, context _: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct FerryWebView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var webView: WKWebView?
    private let url = URL(string: "https://www.obilet.com/feribot-bileti-sorgulama")!

    var body: some View {
        NavigationView {
            ZStack {
                Color.oWhite.ignoresSafeArea()

                WebView(url: url, webView: $webView)
                    .navigationTitle("obilet.com")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Kapat") {
                                dismiss()
                            }
                            .foregroundColor(.oMain)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Button {} label: {
                                    VStack(alignment: .leading, spacing: 5) {
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(Color.oMain, lineWidth: 2)
                                            .frame(width: 20, height: 12)

                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.oMain, lineWidth: 1)
                                            .frame(width: 15, height: 1)

                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.oMain, lineWidth: 1)
                                            .frame(width: 10, height: 1)
                                    }
                                }

                                Button {
                                    webView?.reload()
                                } label: {
                                    Image(systemName: AppIcons.clock)
                                }
                                .foregroundColor(.oMain)
                            }
                        }

                        ToolbarItemGroup(placement: .bottomBar) {
                            HStack {
                                Button {
                                    webView?.goBack()
                                } label: {
                                    Image(systemName: AppIcons.chevronLeft)
                                        .font(.system(size: 20))
                                        .foregroundStyle(.oGray)

                                }.frame(maxWidth: .infinity)

                                Button {
                                    webView?.goForward()
                                } label: {
                                    Image(systemName: AppIcons.chevronRight)
                                        .font(.system(size: 20))
                                        .foregroundStyle(.oGray)
                                }.frame(maxWidth: .infinity)

                                Button {
                                } label: {
                                    Image(systemName: AppIcons.share)
                                        .font(.system(size: 20))
                                        .foregroundStyle(.oMain)
                                }.frame(maxWidth: .infinity)

                                Button {
                                    UIApplication.shared.open(url)
                                } label: {
                                    Image(systemName: AppIcons.safari)
                                        .font(.system(size: 20))
                                        .foregroundStyle(.oMain)
                                }.frame(maxWidth: .infinity)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    FerryWebView()
}
