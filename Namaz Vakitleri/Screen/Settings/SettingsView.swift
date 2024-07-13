//
//  SettingsView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isShowSelectView: Bool = false
    @State var isShowNotificationView: Bool = false
    
    @State var isSelectStar: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(0 ..< 25) { framework in
                        HStack {
                            Text("Konya, Selçuklu")
                                .foregroundStyle(Color(.label))
                            Spacer()
                            Image(systemName: isSelectStar ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                                .padding(.horizontal)
                                .onTapGesture {
                                    isSelectStar.toggle()
                                }
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                                .padding(.horizontal)
                                .onTapGesture {
                                    print("star")
                                }
                        }
                        .padding()
                        .modifier(ViewShadow_Modifier())
                        .listRowSeparator(.hidden)
                    }
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
//                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.brown, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button {
                        } label: {
                            Text("Ayarlar")
                                .fontWeight(.regular)
                                .foregroundStyle(Color(.label))
                                .font(.largeTitle)
                        }.padding(.bottom, 10)
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            isShowNotificationView.toggle()
                        } label: {
                            Image(systemName: "bell.fill")
                                .foregroundStyle(Color(.label))
                        }.padding(.bottom, 10)
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            isShowSelectView.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color(.label))
                        }.padding(.bottom, 10)
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                    }
                }
            }
            .navigationTitle("")
            .navigationDestination(isPresented: $isShowSelectView) {
                SelectView()
            }
            .navigationDestination(isPresented: $isShowNotificationView) {
                NotificationControlView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    SettingsView()
}
