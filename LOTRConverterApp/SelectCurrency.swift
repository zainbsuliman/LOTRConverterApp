//
//  SelectCurrency.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 03/06/1446 AH.
// تعلت كيغ اعدل على الاسم
import SwiftUI
struct SelectCurrency: View {
    
    @Environment(\.dismiss)var dismiss
    @Binding var TopCurrency : Currency
    @Binding
    var bottomCurrency : Currency
    
    var body: some View {
        ZStack{
            // BackgroundImage
            Image(.parchment)
                .resizable()
                .scaledToFill()
                .background(.brown)
                .ignoresSafeArea()
            
            VStack{
                // text
                Text("Select The Currency you are starting with:")
                    .fontWeight(.bold)
                    .padding(.top)
                
               
                // راح استخدم LazyVGrid هي اللي ترتب لي العناصر كاعمده بدل ما اسوي في ستاك واتش ستاك  واقدر اعط الاعمده علي( كيفي
                IconGrid(currency: $TopCurrency)
               
                
                
                // text
                Text(" Select the currency you  would like to convert to:")
                    .fontWeight(.bold)
                    
                
                //currency Icon
                
              
                IconGrid(currency:$bottomCurrency)
                
                // Done Button
                Button("Done"){
                    
                    dismiss()
                    
                }.buttonStyle(.borderedProminent)// عشان نشكل الخلفيه للبوتن فيه خيارات كثره ممتازه بدل ماستخدم الراوند ريكتانقل
                    .tint(.brown.mix(with: .black, by: 0.2)) // مره مفيده لمكس الالوان
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)//  تستخدم للدارك مود
                
                
            }
            .padding(100)
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}
#Preview {
    
    @Previewable @State var TopCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    SelectCurrency(TopCurrency: $TopCurrency, bottomCurrency: $bottomCurrency) // Self هذا هو اللي يقارنها مع الاشياء اللي بال فور لوب
}
