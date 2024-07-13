//
//  SearchTF+Modifier.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 7.05.2024.
//
import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "x.circle.fill")
                            .font(.system(size: 13))
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}
