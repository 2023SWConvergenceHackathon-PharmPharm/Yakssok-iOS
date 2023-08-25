//
//  Ex+ Transition.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .scale.combined(with: .move(edge: .bottom)),
            removal: .scale.combined(with: .move(edge: .top)))
    }
}
