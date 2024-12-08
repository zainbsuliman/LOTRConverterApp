//
//  ExchangeRate.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 03/06/1446 AH.
// تعلت كيغ اعدل على الاسم
import SwiftUI
struct ExchangeRate: View {
    
    //let نخليها  ثوابت لان لايمكن تتغير من اليورز
    // : احطها اذا كان بعدها داتاتايب مو اسناد قيمه
    // نسويها كذا عشان مايتكرر الكود عندي بس استدعي الكلاس واعطيه قيم لهذي المتغيرات بدون ما اكرر الكود
    let leftImage : ImageResource
    let rightImage :ImageResource
    let text :String
    
    var body: some View {
        HStack{
            // left image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
            //Text
            Text(text)
            
            //Right image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
            
            
            
        }
    }
}
#Preview {
    ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, text: "1  silver piece Piece =4 silver penny")
}
