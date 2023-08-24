//
//  Ex+ Font.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/24.
//

import SwiftUI

extension Font {
    static let title1 = pretendard(size: 26, .regular)
    static let title1Bold = pretendard(size: 26, .bold)
    
    static let title2 = pretendard(size: 22, .regular)
    static let title2Bold = pretendard(size: 22, .bold)
    
    static let title3 = pretendard(size: 20, .regular)
    static let title3SemiBold = pretendard(size: 20, .semiBold)
    
    static let headline = pretendard(size: 17, .regular)
    static let headlineSemiBold = pretendard(size: 17, .semiBold)
    
    static let body1 = pretendard(size: 16, .regular)
    static let body1SemiBold = pretendard(size: 16, .semiBold)
    
    static let subheadline = pretendard(size: 15, .regular)
    static let subheadlineSemiBold = pretendard(size: 15, .semiBold)
    
    static let body2 = pretendard(size: 14, .regular)
    static let body2SemiBold = pretendard(size: 14, .semiBold)
    
    static let caption1 = pretendard(size: 12, .regular)
    static let caption1SemiBold = pretendard(size: 12, .semiBold)
    
    static let caption2 = pretendard(size: 10, .regular)
    static let caption2SemiBold = pretendard(size: 10, .semiBold)
    
    enum Pretendard {
        case regular
        case semiBold
        case bold
        
        var value: String {
            switch self {
            case .regular:
                return "Pretendard-Regular"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .bold:
                return "Pretendard-Bold"
            }
        }
    }

    static func pretendard(size: CGFloat = 13, _ type: Pretendard) -> Font {
        return .custom(type.value, size: size)
    }
}
