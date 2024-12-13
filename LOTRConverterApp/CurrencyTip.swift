//
//  CurrencyTip.swift
//  LOTRConverterApp
//
//  Created by Zainab Alatwi  on 12/06/1446 AH.
//

//هذا الفريم ورك المقدم من ابل  فايدته لما تبي تحطي معلومالت لاستخدام هذا  التطبيق مثلا انه ينقر الزر كذا وهكذا
 import TipKit

struct CurrencyTip: Tip {
    
    var title: Text = Text("Change Currency ")
        
    var message: Text? = Text("you can tap the left or right currency button to bring up  the select currency screen ")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
}
