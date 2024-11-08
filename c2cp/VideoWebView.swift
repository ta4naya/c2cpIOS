//
//  VideoWebView.swift
//  c2cp
//
//  Created by mac on 12.05.24.
//
import SwiftUI
import WebKit

struct VideoWebView: View {
    var url: URL
    
    var body: some View {
        WebView(url: url)
            .navigationBarTitle(Text("Video"), displayMode: .inline)
    }
}

