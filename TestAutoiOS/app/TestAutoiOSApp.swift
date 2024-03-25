//
//  TestAutoiOSApp.swift
//  TestAutoiOS
//
//  Created by Rui Reis on 21/03/2024.
//

import SwiftUI

@main
struct TestAutoiOSApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
