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
    
    
    
    func  Convert(_ amountString:String , to currency:Currency)->String{
        //نبي نحول المدخل اللي يدخله اليوزر في اول صفحه الى رقم  وبتحديد دبل اذا مادخل رقم ماراح يظهر له شي اواذا دخل رقم راح تتم العمليه الحسابيه
        //1- نحول القيمه لدبلamountString
        guard let doubleAmount = Double(amountString)
                
        else{
            return ""
        }
        //2- اذا كان المدخل قيمه يتم تنفيذ هذه العمليه الحسابيه
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String( format: "%.2f",convertedAmount)// اللي بالبرتقالي هذا فورمات يطلع لي بس ٢ ديجتل من لرقم عشان مايكتب لي اكثر من خانه
        
    }
    
}
