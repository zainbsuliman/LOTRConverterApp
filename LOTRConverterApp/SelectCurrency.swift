//
//  SelectCurrency.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 03/06/1446 AH.
// تعلت كيغ اعدل على الاسم
import SwiftUI
struct SelectCurrency: View {
    
    @Environment(\.dismiss)var dismiss
    @State var currency : Currency
    
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
                
                
               
                // راح استخدم LazyVGrid هي اللي ترتب لي العناصر كاعمده بدل ما اسوي في ستاك واتش ستاك  واقدر اعط الاعمده علي( كيفي
                
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    
                    ForEach(Currency.allCases) { currency in // استعدينا الenum اسمها currency
                        //self استخدمه عشان افرق بين الcurrency اللي موجوده فاللي قبلها سيلف معناها اللي عرفتها فوق كمتغير وليست العداد اللي حطيته قبل  in
                        
                        if self.currency == currency{
                            // قيمه self اول مره تعتمد على اللي حطيته تحت في preview
                            // بعدها كل ماضغت على صوره عمله راح تتحدث قيمه self من حالها وتقارن
                            CurrencyIcon(currencyImage:currency.image, currencyName:currency.name)
                                .shadow( color: .black,radius: 10)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black.opacity(0.5), lineWidth:3)
                                    
                                    
                                }
                        }else{
                            CurrencyIcon(currencyImage:currency.image, currencyName:currency.name)
                                .onTapGesture{
                                    self.currency = currency
                                }
                            
                        }
                        
                           
                    }
                    
                    
                }
               
                
                
                // text
                Text(" Select the currency you  would like to convert to:")
                    .fontWeight(.bold)
                    
                
                //currency Icon
              
                
                
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
        }
    }
}
#Preview {
    SelectCurrency(currency: .copperPenny) // Self هذا هو اللي يقارنها مع الاشياء اللي بال فور لوب
}
