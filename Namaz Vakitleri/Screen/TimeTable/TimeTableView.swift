//
//  TimeTableView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import SwiftUI

struct TimeTableView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(0 ..< 20) { framework in
                            VStack( spacing: 20) {
                                HStack {
                                    VStack {
                                        Text("6 Mayıs Pazartesi")
                                            .foregroundStyle(Color(.label))
                                            .fontWeight(.semibold)
                                        Divider().frame(width: 100)
                                        Text("27 Şevval 1445")
                                            .foregroundStyle(Color(.label))
                                    }
                                    TimeTableRemoteImage(urlString: "https://namazvakti.diyanet.gov.tr/images/i7.gif")
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        
                                }
                                HStack {
                                    VStack {
                                        Text("İmsak").fontWeight(.light)
                                            .foregroundStyle(Color(.label))
                                        Text("06:30")
                                            .foregroundStyle(Color(.label))
                                    }.frame(maxWidth: getSize())
                                    VStack {
                                        Text("Güneş").fontWeight(.light)
                                            .foregroundStyle(Color(.label))
                                        Text("06:30")
                                            .foregroundStyle(Color(.label))
                                    }.frame(maxWidth: getSize())
                                    VStack {
                                        Text("Öğle").fontWeight(.light)
                                            .foregroundStyle(Color(.label))
                                        Text("06:30")
                                            .foregroundStyle(Color(.label))
                                    }.frame(maxWidth: getSize())
                                    VStack {
                                        Text("İkindi").fontWeight(.light)
                                            .foregroundStyle(Color(.label))
                                        Text("06:30")
                                            .foregroundStyle(Color(.label))
                                    }.frame(maxWidth: getSize())
                                    VStack {
                                        Text("Akşam").fontWeight(.light)
                                            .foregroundStyle(Color(.label))
                                        Text("06:30")
                                            .foregroundStyle(Color(.label))
                                    }.frame(maxWidth: getSize())
                                    VStack {
                                        Text("Yatsı").fontWeight(.light)
                                            .foregroundStyle(Color(.label))
                                        Text("06:30")
                                            .foregroundStyle(Color(.label))
                                    }.frame(maxWidth: getSize())
                                }
                                
                                .font(.callout)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .modifier(ViewShadow_Modifier())
                            .listRowSeparator(.hidden)
                        }
                    }
                    .scrollIndicators(.hidden)
                    .listStyle(.plain)
                    .navigationTitle(Text("🕋 KONYA"))
                    .navigationBarTitleDisplayMode(.automatic)
                    .toolbarBackground(.brown, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

func getSize() -> CGFloat? {
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        return nil
    case .pad:
        return .infinity
    default:
        return nil
    }
}

#Preview {
    TimeTableView()
}
