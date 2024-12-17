//
//  WebView.swift
//  FetchRecipeApp
//
//  Created by R C on 12/17/24.
//

import SwiftUI
import WebKit

// MARK: - WebView Component
struct WebView: View {
    let url: String

    var body: some View {
        WebViewWrapper(urlString: url)
            .navigationBarTitle("Recipe", displayMode: .inline)
    }
}

struct WebViewWrapper: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
