//
//  WebView.swift
//  c2cp
//
//  Created by mac on 09.05.24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
