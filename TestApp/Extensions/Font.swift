//
//  Font.swift
//  TestApp
//
//  Created by Jagdeep Singh on 04/06/24.
//

import SwiftUI

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat)-> Font {
        return .custom(font.rawValue, size: size)
    }
}
