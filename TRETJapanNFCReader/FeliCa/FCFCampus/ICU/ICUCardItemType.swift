//
//  ICUCardItemType.swift
//  TRETJapanNFCReader
//
//  Created by Qs-F on 2019/09/26.
//  Copyright © 2019 treastrain / Tanaka Ryoga. All rights reserved.
//

import Foundation

// data typs which can be obtained from ICU Student ID card.
public enum ICUCardItemType: UInt16, CaseIterable, FeliCaCardItemType {
    case identity = 0x1A8B
    case transactions = 0x120F
    
    // typeof FeliCaServiceCode == UInt16
    internal init?(_ serviceCode: FeliCaServiceCode) {
        let service = ICUCardItemType(rawValue: serviceCode)
        switch service {
        case .some:
            self = service!
        case .none:
            return nil
        }
    }
    
    var serviceCode: FeliCaServiceCode {
       self.rawValue
    }
    
    var blocks: Int {
        switch self {
        case .identity:
            return 2
        case .transactions:
            return 10
        }
    }
}
