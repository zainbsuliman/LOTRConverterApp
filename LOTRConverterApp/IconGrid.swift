//
//  IconGrid.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 03/06/1446 AH.
// تعلت كيغ اعدل على الاسم
import SwiftUI
// هذي الصفحه بس لتكرار الالعملات
// نحذف كل شي ماعادا LAZY
struct IconGrid: View {

    @Binding var currency : Currency
    // لما نستخدم هذا المتغير في الكود لازم الاستدعاء يكون قبل اسمه $
    
    var body: some View {
       
                
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
               
                
                
        }
    }
#Preview {
    //اذا سوينا بايندينق لازم نعرف تحت المتغير مره ثانيه  من نوع ستسيت وبريف يو بال
    @Previewable @State var currency: Currency = .silverPenny
    IconGrid(currency: $currency) // Self هذا هو اللي يقارنها مع الاشياء اللي بال فور لوب
}
