//
//  Init.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 24/02/2023.
//

import Foundation
import Usercentrics


func sdkInit(ucId: String, isRuleset: Bool){
    
    var id = SDKInitData.settingsId
    if(!ucId.isEmpty){
        id = ucId
    }
    
    let options = UsercentricsOptions()
    
    if (isRuleset){
        options.ruleSetId = id
        print("\(SDKInitData.LOG_TAG) Using ruletsetId: \(id)")
    } else {
        options.settingsId = id
        print("\(SDKInitData.LOG_TAG) Using settingsId: \(id)")
    }
    
    options.loggerLevel = UsercentricsLoggerLevel.debug
    options.consentMediation = false
    //options.networkMode = NetworkMode.eu
    UsercentricsCore.configure(options: options)

}
