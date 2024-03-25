//
//  PrintCCPAData.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 25/01/2024.
//

import Foundation
import Usercentrics


func getCCPAData(){
    UsercentricsCore.isReady { _ in
        let uspData = UsercentricsCore.shared.getUSPData()
        let uspString = uspData.uspString
        print("CCPA String: \(String(describing: uspString))")
    } onFailure: { error in
        // Handle error
        print("SDK is not yet ready. Error: \(error.localizedDescription)")
    }

}
