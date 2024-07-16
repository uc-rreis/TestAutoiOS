//
//  PrintGDPRData.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 25/01/2024.
//

import Foundation
import Usercentrics

func getGDPRData(consents: [UsercentricsServiceConsent]) {
//    //CMP Data
    let data = UsercentricsCore.shared.getCMPData()
    let categories = data.categories
//    printSectionTitle(title: "CMP DATA")
//    print("Categories: \(categories)")
    
    printSectionTitle(title: "GCPR CONSENTS")
    for consent in consents {
        print("\(String(describing: consent.dataProcessor).padding(toLength: 40, withPad: " ", startingAt: 0)) | TemplateId: \(String(describing: consent.templateId).padding(toLength: 10, withPad: " ", startingAt: 0)) | Consent Status: \(String(describing: consent.status).padding(toLength: 10, withPad: " ", startingAt: 0)) ")
    }
    
    printSectionTitle(title: "GCPR CATEGORIES")
    for cat in categories {
        if let description = cat.description_ {
            print("is Essential: \(String(describing: cat.isEssential)) -- Description: \(String(describing: description)) -- Label: \(String(describing: cat.label))")
        }
    }
    //print(categories)
}
