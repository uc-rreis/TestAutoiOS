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
                        Toggle(isOn: $isRuleset) {
                            Text("Is RulesetId")
                                .font(.subheadline)
                        }
                        .accessibilityIdentifier("Is RulesetId")
                    }
                    .padding(10)
                    
                    Button("Initialized SDK"){
                        sdkInit(ucId: ucId, isRuleset: isRuleset)
                        UsercentricsUIViewController().showFirstLayer(layout: .full)
                    }
                    .frame(width: 250, height: 35)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(5)
                    .padding(10)
                    .accessibilityIdentifier("Initialize SDK")
                    
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
                        .accessibilityIdentifier("Full CMP")
                        
                        Button("First Layer Bottom"){
                            UsercentricsUIViewController().showFirstLayer(layout: .popup(position: .bottom))
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("First Layer Bottom")
                        
                        Button("First Layer Center"){
                            UsercentricsUIViewController().showFirstLayer(layout: .popup(position: .center))
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("First Layer Center")
                        
                        Button("First Layer Sheet"){
                            UsercentricsUIViewController().showFirstLayer(layout: .sheet)
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("First Layer Sheet")
                        
                        
                        Button("Second Layer"){
                            UsercentricsUIViewController().showSecondLayer()
                        }
                        .frame(width: 250, height: 35)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(5)
                        .padding(5)
                        .accessibilityIdentifier("Second Layer")
                    }
                    .padding()
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.yellow, lineWidth: 2)
                    )
                    
                    Spacer(minLength: 3.0)
                
                    
                    NavigationLink(destination: UCWebView()){
                        Text("Open Webview")
                            .frame(width: 250, height: 40)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(5)
                            .padding(5)
                            .accessibilityIdentifier("Preview")
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
