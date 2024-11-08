//
//  HtmlWebView.swift
//  c2cp
//
//  Created by mac on 07.06.24.
//

import SwiftUI
import WebKit

struct HtmlWebView: UIViewRepresentable {
    var htmlContent: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = true  // Enable scrolling
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
