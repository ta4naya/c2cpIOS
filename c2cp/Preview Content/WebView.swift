//
//  WebView.swift
//  c2cp
//
//  Created by mac on 07.06.24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
