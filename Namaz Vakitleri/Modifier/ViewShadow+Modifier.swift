//
//  ViewShadow+Modifier.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 17.05.2024.
//

import SwiftUI

struct ViewShadow_Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(color: .brown, radius: 5)
    }
}
