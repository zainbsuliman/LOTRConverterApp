//
//  ContentView.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 29/05/1446 AH.
//

import SwiftUI

struct ContentView: View {
    // Stord Prpoperty
    //@State  one of the Prpoerty Wrappers / وظيفتها هي تسمح للمتغير  يتغير حالته
    //Var //  يسمح بتغير  المتغير
    
    
    @State var showExchangeInfo = false
    @State var leftAmount = ""// لانها راح تكون مدخل من المستخدم
    @State var rightAmount = ""
    
    var body: some View {
        ZStack{
            //background image
            Image(.background)// افضل طريقه لعرض الصوره بدل ماحطها في "" لان ممكن يكون السبيلنق غلط ومايعرفه البرنامج
                .resizable()// عشان الصوره تكون فيت على مقاس الجوال او الفريم لانها بشكل افتراضي تكون زوم وكبيره
                .ignoresSafeArea()
            
            VStack{
               //image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()//  تخليها حجمها وطولها طبيعي  لكن للان كبيره
                    .frame( height:200 )
                //Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                HStack{
                    //left section
                    VStack{
                        //currncy
                      HStack{
                           //curancy image
                          Image(.silverpiece)
                              .resizable()
                              .scaledToFit()
                              .frame( height:33 )
                          //currency text
                          Text("Silver Piece")
                              .font(.headline)
                              .foregroundStyle(.white)
                        }
                      .padding(.bottom, -5)
                     
                       //text field
//                        Text("Text field")
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)// يضيف بودرد ابيض للتكست
                            
                    
                         
                    }
                    
                    //Equal sign
                    Image(systemName: "equal")
        
                        .font(.largeTitle)// نحطها مع التيكست او الايمج
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    //Right section
                    VStack{
                        //currncy
                        HStack{
                            //curancy text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //currency image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame( height:33 )
                            
                        }
                        .padding(.bottom, -5)
                        //text field
                        TextField("Amount",text:$rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)// عشان تصير الكلمه يمين
                    }
                    
                }.padding()
                    .background(Color.black.opacity(0.5))
                    .clipShape(.capsule)// تغير بشكل الباكقرواند بحيث يصير كبسوله
                Spacer()
                //info butten
                HStack {
                    
                    Spacer()

                    Button{
                        
                        showExchangeInfo.toggle()
                        
                        // لتاكد من انه يشتغل في الكونسل  print("State \(showExchangeInfo)")
                        
                        
                    } label:{
                        // الخصائص اللي نبيها للبوتن
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        
                        
                        
                    }.padding(.trailing)//  سوي بادينق على اليمن  فقط
                    //sheetمو لازم يكون مكانها هنا تحت البوتن  لا في اي مكان تصلح  
                        .sheet(isPresented: $showExchangeInfo) {
                            ExchangeInfo()
                            // لما يكون القيمه ترو بنقر تفتح الصفحه واذا غلط تتغلق من خلال النقر  هذي طبعا قيمه$showExchangeInfo
                            
                        }
                }
                
               
            }
            
            
            
            
        }
    }
}

#Preview {
    ContentView()
}
