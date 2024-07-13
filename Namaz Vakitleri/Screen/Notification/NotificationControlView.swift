//
//  NotificationControlView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 6.05.2024.
//

import SwiftUI

struct NotificationControlView: View {
    
    @State var isActiveToggleSabah: Bool = false
    @State var isActiveToggleOgle: Bool = false
    @State var isActiveToggleIkindi: Bool = false
    @State var isActiveToggleAksam: Bool = false
    @State var isActiveToggleYatsi: Bool = false
    
    var body: some View {
        VStack (spacing: 30){
            Group {
                Toggle("Sabah", isOn: $isActiveToggleSabah)
                Toggle("Öğle", isOn: $isActiveToggleOgle)
                Toggle("İkindi", isOn: $isActiveToggleIkindi)
                Toggle("Akşam", isOn: $isActiveToggleAksam)
                Toggle("Yatsı", isOn: $isActiveToggleYatsi)
            }
            .tint(.brown)
            
            Spacer()
            
            Button {
                
            } label: {
                ApplyButton(title: "Kaydet")
                .clipShape(RoundedRectangle(cornerRadius: 3))
            }
        }
        .padding()
    }
}

#Preview {
    NotificationControlView()
}
