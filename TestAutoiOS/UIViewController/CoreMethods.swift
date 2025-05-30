//
//  CoreMethods.swift
//  TestAutoiOS
//
//  Created by Rui Reis on 16/07/2024.
//

import Foundation
import Usercentrics

func setSettingsId (settingsId: String){
    return SDKInitData.settingsId = settingsId
}

func getDefaultSettingsId() -> String {
    return SDKInitData.settingsId
}

func clearUserSession(){
    UsercentricsCore.shared.clearUserSession(onSuccess: { status in
        // This callback is equivalent to isReady API
        print("Session has ben cleared")
    }, onError: { error in
        // Handle non-localized error
        print("Error when clearing user session: \(error.localizedDescription)")
    })
}
