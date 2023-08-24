//
//  Ex+ Color.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/24.
//

import SwiftUI

extension Color {
    ///
    /// 컬러 적용 프로퍼티
    ///
    /// ```
    /// Color.theme.primary.main
    /// ```
    static let theme = ColorTheme()
}

struct ColorTheme {
    let background = BackGround()
    let gray = Gray()
    let medicine = Medicine()
    let primary = Primary()
    
    struct BackGround {
        let white = Color("BackgroundWhite")
    }
    
    struct Gray {
        let black = Color("Black")
        let gray1 = Color("Gray1")
        let gray2 = Color("Gray2")
        let gray3 = Color("Gray3")
        let gray4 = Color("Gray4")
        let gray5 = Color("Gray5")
        let gray6 = Color("Gray6")
        let white = Color("White")
    }
    
    struct Medicine {
        let first = Color("First")
        let first20 = Color("First20")
        let second = Color("Second")
        let second20 = Color("Second20")
        let third = Color("Third")
        let third20 = Color("Third20")
        let fourth = Color("Fourth")
        let fourth20 = Color("Fourth20")
        let temp = Color("Temp")
        let temp20 = Color("Temp20")
    }
    
    struct Primary {
        let main = Color("Main")
        let main0 = Color("Main0")
        let main10 = Color("Main10")
        let main20 = Color("Main20")
        let main30 = Color("Main30")
        let main40 = Color("Main40")
    }
}
