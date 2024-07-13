//
//  SwiftUIView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 7.05.2024.
//

import SwiftUI

struct SelectListView: View {
    
    @State var tfInputKey = ""
    @Binding var listType: Int
    @Binding var selectItem: [String]
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            customTF(placeHolder: "Ara", tfInput: tfInputKey)
            
            Divider()
            
            ScrollView {
                ForEach(0 ..< 120) { item in
                    Button {
                        selectItem[listType] = "deneme \(item), \(listType)"
                        dismiss()
                    } label: {
                        VStack {
                            HStack {
                                Text("deneme \(item), \(listType)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.label))
                                Spacer()
                            }
                        }
                        .padding()
                    }
                    Divider()
                }
            }
        }
        .onAppear {
            print(listType)
        }
        
        
    }
}

#Preview {
    SelectListView(listType: .constant(0), selectItem: .constant([]))
}
