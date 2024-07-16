//
//  CoreMethods.swift
//  TestAutoiOS
//
//  Created by Rui Reis on 16/07/2024.
//

import Foundation

func setSettingsId (settingsId: String){
    return SDKInitData.settingsId = settingsId
}

func getDefaultSettingsId() -> String {
    return SDKInitData.settingsId
}
