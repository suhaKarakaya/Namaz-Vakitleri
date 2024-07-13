//
//  Selectview.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import SwiftUI

struct SelectView: View {
    
    @State var isShowSelectListView = false
    @State var selectListType: Int = 0
    @State var selectItemList: [String] = ["Seçiniz","Seçiniz","Seçiniz"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            PickerTitleView(title: "Ülkeler")
            
            Button{
                selectListType = 0
                isShowSelectListView.toggle()
            } label: {
                PickerView( value: $selectItemList[0])
            }
            
            PickerTitleView(title: "Şehirler")
            
            Button{
                selectListType = 1
                isShowSelectListView.toggle()
            } label: {
                PickerView( value: $selectItemList[1])
            }
            
            PickerTitleView(title: "İlçeler")
            
            Button{
                selectListType = 2
                isShowSelectListView.toggle()
            } label: {
                PickerView( value: $selectItemList[2])
            }
            
            Spacer()
            
            Button {
            } label: {
                ApplyButton(title: "Kaydet")
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .padding()
            }
        }
        .padding(.top, 10)
        .navigationTitle("")
        .navigationDestination(isPresented: $isShowSelectListView) {
            SelectListView(listType: $selectListType, selectItem: $selectItemList)
        }
        
        
    }
}

#Preview {
    SelectView()
}

struct PickerTitleView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.light)
            .foregroundStyle(.brown)
            .padding(.leading)
    }
}


struct PickerView: View {
    @Binding var value: String
    var body: some View {
        HStack {
            Text(value)
                .fontWeight(.ultraLight)
                .font(.title3)
                .foregroundStyle(Color(.label))
                .padding(.vertical)
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(Color(.systemGray3))
        }
        .padding()
        .modifier(ViewShadow_Modifier())
        .padding(.horizontal)
    }
}
