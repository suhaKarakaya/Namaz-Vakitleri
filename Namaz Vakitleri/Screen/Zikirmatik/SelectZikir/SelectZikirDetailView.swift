//
//  SelectZikirDetailView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 8.05.2024.
//

import SwiftUI

struct SelectZikirDetailView: View {
    
    @Binding var value: String
    @Binding var isShowDetail: Bool
    
    var body: some View {

        VStack {
            Text(value)
                .padding()
            
        }
        .frame(width:  (UIScreen.main.bounds.width / 3) * 2, height:  (UIScreen.main.bounds.height / 3) * 2)
        .background(Color(.systemBackground))
        .cornerRadius(3)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowDetail = false
        }, label: {
            Image(systemName: "x.square.fill")
                .resizable()
                .foregroundColor(.brown)
                .frame(width: 25, height: 25)
                .frame(alignment: .trailing)
                .padding()
        }), alignment: .topTrailing)
        
        
    }
}

#Preview {
    SelectZikirDetailView(value: .constant("dsamdkmsakldmlsakdmklsamdkmsakdmsakmdklsamdkmslakmdklsamdklmsakdmasklmdklsamdklmsakldmslkamdklsamdklmsalkdmklasmdklasmdklasmkdlmsakldmaslkmdamdlmsalkdmklsamdkmsakdmsklamdlksamdklmsakldmsalkmd"), isShowDetail: .constant(false))
}
