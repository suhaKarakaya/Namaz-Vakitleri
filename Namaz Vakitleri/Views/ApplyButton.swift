//
//  ApplyButton.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 17.05.2024.
//

import SwiftUI

struct ApplyButton: View {
    
    var title: String = ""
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundStyle(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.brown)
        }
    }
}

#Preview {
    ApplyButton(title: "")
}
