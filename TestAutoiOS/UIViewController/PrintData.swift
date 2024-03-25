//
//  PrintData.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 23/02/2023.
//

import Foundation
import Usercentrics
import UsercentricsUI

public func applyResponse(userInteraction: UsercentricsUserInteraction){
    UsercentricsCore.isReady { status in
        let consents  = status.consents
        
        printSectionTitle(title: "USER INTERACION")
        print(userInteraction)
        
        getGDPRData(consents: consents)
        
        if(UsercentricsCore.shared.getCMPData().activeVariant == UsercentricsVariant.tcf) {
            print("\(SDKInitData.LOG_TAG) activeVariant is \(UsercentricsVariant.tcf)")
            getTCFData()
        }
        
        if(UsercentricsCore.shared.getCMPData().activeVariant == UsercentricsVariant.ccpa) {
            getCCPAData()
        }

    } onFailure: { error in
        print("\(SDKInitData.LOG_TAG) Error on initialization: \(error.localizedDescription)")
    }
}


func printSectionTitle(title: String) {
    
    let str = String(repeating: "-", count: title.count + 12)
    print(str)
    print("----- \(title) -----")
    print(str)
}

func getDateTime() -> String {
    let date = Date()
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return df.string(from: date)
}
