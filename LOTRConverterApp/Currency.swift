//
//  Currency.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 06/06/1446 AH.
//

import SwiftUI

enum Currency :Double,CaseIterable , Identifiable { // دبل او اي متغير ينحط هنا يسمي row type
     // كل واحد يحتاج  قيمه ،اسم ، صوره
    // قيمه
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    // صوره
    var id : Currency { self } // لا ن فوق كاتبن تعريف  وهنا التعريف يكون 
    
    
    var image:ImageResource {
       
    switch self {// SELF معناهها كل العناصر الموجوده في enum احطها
    case .copperPenny:
            .copperpenny
        case .silverPenny:
            .silverpenny
    case .silverPiece:
            .silverpiece
    case .goldPenny:
            .goldpenny
    case .goldPiece:
            .goldpiece
        }
        
    }
    
    
    // نحتاج اسم
    
    var name : String {
        
        switch self {
            
        case .copperPenny:
            "Copper Penny"
            case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
            
        }
        
    }
    
    
    
    
    
    
    
}
