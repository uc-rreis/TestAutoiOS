//
//  UCWebView.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 25/01/2024.
//

import SwiftUI

struct UCWebView: View {
    var body: some View {
        VStack{
            Text("Usercentrics Web SDK")
            PresentUCWebView()
        }
    }
}

struct UCWebView_Previews: PreviewProvider {
    static var previews: some View {
        UCWebView()
    }
}
