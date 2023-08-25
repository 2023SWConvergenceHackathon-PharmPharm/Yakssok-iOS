//
//  Ex+ View.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import SwiftUI

extension View {
    func isHidden(_ isHidden: Bool) -> some View {
        self.modifier(ViewHideModifier(isHidden: isHidden))
    }
}

struct ViewHideModifier: ViewModifier {
    let isHidden: Bool
    
    func body(content: Content) -> some View {
        if isHidden {
            content
                .hidden()
        } else {
            content
        }
    }
}
