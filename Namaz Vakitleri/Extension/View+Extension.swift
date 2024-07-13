//
//  View+Extension.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 7.05.2024.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true:
            self.hidden()
        case false:
            self
        }
    }
    
    func placeholder<Content: View>(
        when _shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(_shouldShow ? 1 : 0)
                self
            }
        }
    
}
