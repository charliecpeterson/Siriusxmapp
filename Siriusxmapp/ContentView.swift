//
//  ContentView.swift
//  Siriusxmapp
//
//  Created by Charles Peterson on 2/24/24.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(urlString: "https://www.siriusxm.com/player/home")
    }
}

struct WebView: NSViewRepresentable {
    let urlString: String

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            nsView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}
