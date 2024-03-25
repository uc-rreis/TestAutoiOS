//
//  PrintTCFData.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 25/01/2024.
//

import Foundation
import Usercentrics


func getTCFData() {
    // TCF Data
    
    if let isACMEnabled = UsercentricsCore.shared.getCMPData().settings.tcf2?.acmV2Enabled {
        if(isACMEnabled){
            let gacData = UsercentricsCore.shared.getAdditionalConsentModeData()
            let gacString = gacData.acString
            let providers = gacData.adTechProviders
            
            printSectionTitle(title: "ACSTRING")
            print("ACString: \(gacString)")
            
            printSectionTitle(title: "ACM PROVIDERS")
            for provider in providers {
                print("\(String(describing: provider.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: provider.id).padding(toLength: 10, withPad: " ", startingAt: 0)) | Consent: \(String(describing: provider.consent).padding(toLength: 10, withPad: " ", startingAt: 0)) | URL: \(String(describing: provider.privacyPolicyUrl).padding(toLength: 10, withPad: " ", startingAt: 0))")
            }
        }
    }
    
    print("\(SDKInitData.LOG_TAG) Calling getTCFData at \(getDateTime())")
    UsercentricsCore.shared.getTCFData{ tcfData in
        let purposes = tcfData.purposes
        //let specialPurposes = tcfData.specialPurposes
        //let features = tcfData.features
        //let specialFeatures = tcfData.specialFeatures
        //let stacks = tcfData.stacks
        let vendors = tcfData.vendors
        
        print("\(SDKInitData.LOG_TAG) Finished calling getTCFData at \(getDateTime())")
        
         //TCString
        printSectionTitle(title: "TCSTRING")
        //let tcString = UsercentricsCore.shared.getTCString()
        let tcString = tcfData.tcString
        print("TCString: \(tcString)")
        
        //print("-- PURPOSES --")
        let purposesList = purposes.sorted(by: { tcfVendor1, tcfVendor2 in
            tcfVendor1.id < tcfVendor2.id })
        
        printSectionTitle(title: "PURPOSES")
        for purpose in purposesList {
            if let consent = purpose.consent {
                if let purposeLIConsent = purpose.legitimateInterestConsent {
                    print("\(String(describing: purpose.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: purpose.id).padding(toLength: 10, withPad: " ", startingAt: 0)) | Consent: \(String(describing: consent.boolValue).padding(toLength: 10, withPad: " ", startingAt: 0)) | LI Value: \(String(describing: purposeLIConsent.boolValue).padding(toLength: 10, withPad: " ", startingAt: 0))")
                }
            }
        }
        
        printSectionTitle(title: "VENDORS")
        for vendor in vendors {
            print("Vendor: \(vendor.name) -- Consent: \(String(describing: vendor.consent?.boolValue)) -- LI: \(String(describing: vendor.legitimateInterestConsent))" )
            if let consent = vendor.consent, let liconsent = vendor.legitimateInterestConsent {
                print("\(String(describing: vendor.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0))  | Consent: \(String(describing: consent.boolValue).padding(toLength: 10, withPad: " ", startingAt: 0)) | LI Value: \(String(describing: liconsent.boolValue).padding(toLength: 10, withPad: " ", startingAt: 0))")
                if(!vendor.legitimateInterestPurposes.isEmpty){
                    print("-- \(vendor.name) LI Purposes --")
                    for vendor in vendor.legitimateInterestPurposes {
                        print("|$| \(String(describing: vendor.name).padding(toLength: 36, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0)) |$|")
                    }
                }
            }
        }
        
//        printSectionTitle(title: "PURPOSES WITH CONSENT TRUE")
//        let purposesListTrue = purposesList.filter { purpose in purpose.consent == true }
//        for purpose in purposesListTrue {
//        print("\(String(describing: purpose.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: purpose.id).padding(toLength: 10, withPad: " ", startingAt: 0))")
//        }
//
//        printSectionTitle(title: "VENDORS WITH CONSENT TRUE")
//        var vendorsList = vendors.filter { tcfVendor in tcfVendor.consent == true }
//        vendorsList = vendorsList.sorted(by: { tcfVendor1, tcfVendor2 in
//        tcfVendor1.id < tcfVendor2.id })
//
//        for vendor in vendorsList {
//        print("\(String(describing: vendor.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0))")
//        }
//
//        printSectionTitle(title: "VENDORS WITH LI TRUE")
//        var vendorsListLI = vendors.filter { tcfVendor in tcfVendor.legitimateInterestConsent == true }
//        vendorsListLI = vendorsList.sorted(by: { tcfVendor1, tcfVendor2 in
//        tcfVendor1.id < tcfVendor2.id })
//
//        for vendor in vendorsListLI {
//        print("\(String(describing: vendor.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0))")
//             if(!vendor.legitimateInterestPurposes.isEmpty){
//                 print("-- \(vendor.name) LI Purposes --")
//                 for vendor in vendor.legitimateInterestPurposes {
//                     print("|$| \(String(describing: vendor.name).padding(toLength: 36, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0)) |$|")
//                 }
//             }
//        }
    }
}
