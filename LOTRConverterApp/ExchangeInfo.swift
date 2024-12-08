//
//  ExchangeInfo.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 02/06/1446 AH.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
           //background
            Image(.parchment)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .background(Color.brown)
            
            VStack{
                //title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                    Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")

                    .font(.title3)
                    .frame(width: 300, height:200)
                    .padding(.leading)
                    
                     
                    
                
                
                ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, text: " 1 Gold piece = 4 Gold pennies")//SUBVIEW
                // لما اكرر استدعاء الكلاس يسمى نسخه والانقلش Instance
                
                ExchangeRate(leftImage: .goldpenny, rightImage: .silverpiece, text: " 1 Gold panny = 4 Silver pieces ")
                
                ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, text: " 1 Silver piece = 4 Selver pennies")
                
                
                ExchangeRate(leftImage: .silverpenny, rightImage: .copperpenny, text: " 1 selver penny  = 100 copper pennies")
                
                
                Button("Done"){
                    
                    dismiss()
                    
                }.buttonStyle(.borderedProminent)// عشان نشكل الخلفيه للبوتن فيه خيارات كثره ممتازه بدل ماستخدم الراوند ريكتانقل
                    .tint(.brown.mix(with: .black, by: 0.2)) // مره مفيده لمكس الالوان
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)//  تستخدم للدارك مود
                
                
                
            }
            
        }
    }
}

#Preview {
    ExchangeInfo()
}


