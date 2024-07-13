//
//  CreateZikirView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 8.05.2024.
//

import SwiftUI

struct CreateZikirView: View {
    
    @State var tfInput = ""
    
    var body: some View {
        VStack {
            customTF(placeHolder: "Zikirim", tfInput: tfInput)
            
            Spacer()
            
            Button {
            } label: {
                VStack {
                    Text("Kaydet")
                        .foregroundStyle(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(.brown)
                    //                        .clipShape(RoundedRectangle(cornerRadius: 1))
                }
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .padding()
            }
            
        }
    }
}

#Preview {
    CreateZikirView()
}

struct customTF: View {
    var placeHolder: String
    @State var tfInput: String
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("", text: $tfInput, axis: .vertical)
            .accentColor(.brown)
            .modifier(TextFieldClearButton(text: $tfInput))
            .padding(15)
            .foregroundColor(Color(.label))
            .overlay(
                RoundedRectangle(cornerRadius: 3).strokeBorder(Color(.systemGray5), style: StrokeStyle(lineWidth: 1)))
            .placeholder(when: tfInput.isEmpty) {
                Text(placeHolder)
                    .foregroundColor(Color(.systemGray)).padding(15)
                    .italic()
            }
            .font(Font.system(size: 15, design: .default))
            .textInputAutocapitalization(.never)
            .onChange(of: tfInput) { oldValue, newValue in
                if tfInput.last?.isNewline == .some(true) {
                    tfInput.removeLast()
                    isFocused = false
                }
            }
            .focused($isFocused)
            .onSubmit {
                
            }
            .submitLabel(.done)
            .padding()
    }
}
