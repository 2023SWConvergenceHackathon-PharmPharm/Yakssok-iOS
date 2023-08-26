//
//  Ex+ String.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/27.
//

import Foundation
import UIKit

extension String {
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
