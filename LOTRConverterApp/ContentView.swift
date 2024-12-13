//
//  ContentView.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 29/05/1446 AH.
//

import SwiftUI
import TipKit

struct ContentView: View {
    // Stord Prpoperty
    //@State  one of the Prpoerty Wrappers / وظيفتها هي تسمح للمتغير  يتغير حالته
    //Var //  يسمح بتغير  المتغير
    
    
    @State var showExchangeInfo = false
    @State var leftAmount = ""// لانها راح تكون مدخل من المستخدم
    @State var rightAmount = ""
    @State var LeftCurrency: Currency = .silverPiece
    @State var RightCurrency: Currency = .goldPiece
    @State var showSelectCurrency = false
    // فوكس ستيت نوعها بولين فالفكره هنا اذا بدا اليوزر يكتب باليمين يركز ويطلع الناتج اليسار والعكس 
    @FocusState  var leftTyping
    @FocusState var  RightTyping
    
    let currencyTip = CurrencyTip()
    
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
                          Image(LeftCurrency.image)
                              .resizable()
                              .scaledToFit()
                              .frame( height:33 )
                          //currency text
                          Text(LeftCurrency.name)
                              .font(.headline)
                              .foregroundStyle(.white)
                        }
                      .padding(.bottom, -5)
                      .onTapGesture{
                          showSelectCurrency.toggle()
                      }
                        // هنا معناها صفحه المعلومات اللي راح تظهر للمستخدم انه يعلمه ترا يمديك تظغط على اللعمله لتغيرها تضهر له ك بوب
                      .popoverTip(currencyTip,arrowEdge: .bottom)
                     
                       //text field
//                        Text("Text field")
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)// يضيف بودرد ابيض للتكست
                            .focused($leftTyping)
                            
                         
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
                            Text(RightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //currency image
                            Image(RightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame( height:33 )
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture{
                            showSelectCurrency.toggle()
                        }
                        
                        //text field
                        TextField("Amount",text:$rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($RightTyping)
                            .multilineTextAlignment(.trailing)// عشان تصير الكلمه يمين
                        
                            
                        
                    }
                    
                    
                }.padding()
                    .background(Color.black.opacity(0.5))
                    .clipShape(.capsule)// تغير بشكل الباكقرواند بحيث يصير كبسوله
                    .keyboardType(.decimalPad)// نخلي الكيبورد اللي يضهر لليوزر بس اللي فيه ارقام  وكمان نمكن من خلال I/O اللي بستيتنق
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
                    
                }
                // هذي التاسك هي اللي تسمح للتعليمات انها تظهر للمستخدم عندا بدا اول نره للبرنامج عشان مايسوي كراش فاي شي نبي نسويه قبل بدا اليوزر لتطبيق نحطه ب التاسك 
                .task{
                    try? Tips.configure()
                }
                        .onChange(of: leftAmount){
                            if leftTyping{
                                
                                rightAmount = LeftCurrency.Convert(leftAmount, to: RightCurrency)
                            }
                        }
                    //
                        .onChange(of: rightAmount){
                            if RightTyping{
                                leftAmount = RightCurrency.Convert(rightAmount,to : LeftCurrency)
                            }
                        }
                    // هذي عشان نخلي العملات تتغير اشكالها اذا تم الضغط عليها من خلال اليوزر وتتحدث قيمنها 
                        .onChange(of: LeftCurrency){
                            leftAmount = RightCurrency.Convert(rightAmount,to : LeftCurrency)
                        }
                        .onChange(of: RightCurrency){
                            rightAmount = LeftCurrency.Convert(leftAmount, to: RightCurrency)
                        }
                    
                    
                    
                        .sheet(isPresented: $showExchangeInfo) {
                            ExchangeInfo()
                            // لما يكون القيمه ترو بنقر تفتح الصفحه واذا غلط تتغلق من خلال النقر  هذي طبعا قيمه$showExchangeInfo
                            
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            
                            SelectCurrency(TopCurrency: $LeftCurrency, bottomCurrency: $RightCurrency)
                        }
                }
                
               
            }
            
            
            
            
        
    }
}

#Preview {
    ContentView()
}
