//
//  ContentView.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 03/10/2022.
//

import SwiftUI
import Usercentrics
import UsercentricsUI

struct ContentView: View {
    init() {
        UsercentricsUIViewController().showFirstLayer(layout: .sheet)
    }
    
    
    @State private var ucId = ""
    @State private var isRuleset = false
    
    var body: some View {
        
        
        NavigationView{
            VStack {
                Image("usercentrics")
                    .imageScale(.large)
                    .padding(30)
                    .frame(width: 1500, height: 70)
                
                Spacer(minLength: 10.0)
                
                VStack{
                    VStack{
                        TextField("RulesetId/SettingsId", text: $ucId)
                            .textFieldStyle(.roundedBorder)
                            .font(.subheadline)
                            .accessibilityIdentifier("settings_id")
                        Toggle(isOn: $isRuleset) {
                            Text("Is RulesetId")
                                .font(.subheadline)
                        }
                        .accessibilityIdentifier("checkbox_ruleset")
                    }
                    .padding(10)
                    
                    Button("Initialized SDK"){
                        sdkInit(ucId: ucId, isRuleset: isRuleset)
                        UsercentricsUIViewController().showFirstLayer(layout: .full)
                    }
                    .accessibilityIdentifier("btn_init")
                    .frame(width: 250, height: 35)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(5)
                    .padding(10)
                    
                }
                .padding()
                .frame(width: 300, height: 150, alignment: .center)
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.yellow, lineWidth: 2)
                    )
                .accessibilityIdentifier("ucId")
                
                Spacer(minLength: 30.0)
                VStack{
                    VStack{
                        Button("Full CMP"){
                            UsercentricsUIViewController().showFirstLayer(layout: .full)
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("btn_full")
                        
                        Button("First Layer Bottom"){
                            UsercentricsUIViewController().showFirstLayer(layout: .popup(position: .bottom))
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("btn_first_bottom")
                        
                        Button("First Layer Center"){
                            UsercentricsUIViewController().showFirstLayer(layout: .popup(position: .center))
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("btn_first_center")
                        
                        Button("First Layer Sheet"){
                            UsercentricsUIViewController().showFirstLayer(layout: .sheet)
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("btn_first_sheet")
                        
                        
                        Button("Second Layer"){
                            UsercentricsUIViewController().showSecondLayer()
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("btn_second_layer")
                        
                    }
                    .padding()
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.yellow, lineWidth: 2)
                    )
                    
                    Spacer(minLength: 3.0)
                
                    
                    Button("Clear User Session"){
                        clearUserSession()
                    }
                    .frame(width: 250, height: 35)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(5)
                    .padding(5)
                    .accessibilityIdentifier("btn_clear_user_session")
                    
                    NavigationLink(destination: UCWebView()){
                        Text("Open Webview")
                            .frame(width: 250, height: 40)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(5)
                            .padding(5)
                            .accessibilityIdentifier("btn_open_webview")
                    }
                    
                    Spacer(minLength: 15.0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
