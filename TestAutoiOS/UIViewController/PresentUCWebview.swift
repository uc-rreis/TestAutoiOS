//
//  PresentUCWebview.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 25/01/2024.
//

import SwiftUI
import WebKit
import Usercentrics

struct PresentUCWebView: UIViewRepresentable {
    var webView = configWebView()
    
    private var url = getURL()
    
    func makeUIView(context: Context) -> some UIView {
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if let myUrl = URL(string: url) {
            let myRequest = URLRequest(url: myUrl)
            self.webView.load(myRequest)
        }
    }
}

fileprivate func getURL()-> String {
//    var url = "https://app.usercentrics.eu/browser-ui/preview/index.html?settingsId="
//    
//    url += UsercentricsCore.shared.getCMPData().settings.settingsId
//    
//    return url
    
    return "https://app.usercentrics.eu/browser-ui/preview/index.html?settingsId=\(UsercentricsCore.shared.getCMPData().settings.settingsId)"
}
