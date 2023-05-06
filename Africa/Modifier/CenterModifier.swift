//
//  CenterModifier.swift
//  Africa
//
//  Created by Md Abir Hossain on 06-05-2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
