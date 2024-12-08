//
//  CurrencyIcon.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 03/06/1446 AH.
// تعلت كيغ اعدل على الاسم
import SwiftUI
struct CurrencyIcon: View {
    // text لكل صوره للعملات تحتها اسمها
    // image نحط صور
    let currencyImage:ImageResource
    let currencyName:String
    
    @Environment(\.dismiss)var dismiss
    
    var body: some View {
        
                
                
                //currency image
                ZStack(alignment: .bottom){
                    //currency image
                    Image(currencyImage)
                        .resizable()
                        .scaledToFit()
                    
                    Text(currencyName)
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .background(.brown.opacity(0.7))
                    
                }
                .padding(3)
                .frame(width: 100, height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 25))
                
                
               
                    
                
                
                
    }
}
#Preview {
    CurrencyIcon(currencyImage:.copperpenny, currencyName:"Copper Penny" )// هنا فقط عينه مو مهمه لكن اذا ماحطيتها يطلع غلط 
}
