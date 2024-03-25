//
//  WebviewUtils.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 23/02/2023.
//

import Foundation
import SwiftUI
import Usercentrics
import WebKit

func configWebView() -> WKWebView {
    var myWebView = WKWebView()
    
    let sessionData = UsercentricsCore.shared.getUserSessionData()
    let contentController = getContentController(sessionData: sessionData)
    
    configureWebView(contentController, &myWebView)
    
    return myWebView

}

fileprivate func getContentController(sessionData: String) -> WKUserContentController {
    let contentController = WKUserContentController()
    
    // Script to inject session data on webview
    let userSessionData = """
        window.UC_UI_USER_SESSION_DATA = \(sessionData);
    """
    
    // Script to hide privacy button on webview
    let hidePrivacyButton = """
         window.addEventListener('UC_UI_INITIALIZED', function(event) {
          if (window.UC_UI && window.UC_UI.isInitialized()) {
             const element = document.getElementById('usercentrics-root')
             const root = element && element.shadowRoot;
             
             root.querySelector('[data-testid="uc-privacy-button"]').style.display = 'none'
             console.log("Privacy Button hidden.")
          }
        });
        
    """
    
    let userSessionScript = WKUserScript(source: userSessionData, injectionTime: .atDocumentStart, forMainFrameOnly: true)
    contentController.addUserScript(userSessionScript)
    
    let hidePrivacyButtonScript = WKUserScript(source: hidePrivacyButton, injectionTime: .atDocumentStart, forMainFrameOnly: true)
    contentController.addUserScript(hidePrivacyButtonScript)
    
    return contentController
}

fileprivate func configureWebView(_ contentController: WKUserContentController, _ myWebView: inout WKWebView) {
    let webConfiguration = WKWebViewConfiguration()
    webConfiguration.defaultWebpagePreferences.allowsContentJavaScript = true
    webConfiguration.userContentController = contentController
    myWebView = WKWebView(frame: .zero, configuration: webConfiguration)
    myWebView.isInspectable = true
    
    //webView.configuration.preferences.javaScriptEnabled = true
    //myWebView.uiDelegate = self
    
    //myWebView.frame = view.bounds
    myWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
}

