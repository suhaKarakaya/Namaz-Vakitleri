//
//  SelectZikirView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 8.05.2024.
//

import SwiftUI

struct SelectZikirView: View {
    
    @State var isShowDetail: Bool = false
    @State var selectValue: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                
                Divider()
                    .frame(height: 1)
                    .background(.brown)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                
                List {
                    ForEach(0 ..< 20) { framework in
                        HStack {
                            Text("heldsamödkmsadkmsalmdklsamdkasmdklmsakdmsakmdlkasmkdmaslkdmlksamdmdkslmadklsamdklmsakdmklasdlö")
                                .padding(.horizontal)

                            Spacer()
                            
                            Image(systemName: "info.square")
                                .resizable()
                                .foregroundColor(.brown)
                                .frame(width: 25, height: 25)
                                .onTapGesture {
                                    isShowDetail = true
                                    selectValue = String(framework)
                                }
                            ApplyButton(title: "Kaydet")
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                                .frame(width: 100)
                                .padding(.horizontal)
                                .onTapGesture {
                                    print("save")
                                }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .modifier(ViewShadow_Modifier())
                        .listRowSeparator(.hidden)
                    }
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
            }
            .disabled(isShowDetail)
            .blur(radius: isShowDetail ? 20 : 0)
            
            if isShowDetail {
                SelectZikirDetailView(value: $selectValue, isShowDetail: $isShowDetail)
            }
        }
        
    }
}

#Preview {
    SelectZikirView()
}
