//
//  PrayerTimeTabView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import SwiftUI

struct PrayerTimeTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("", systemImage: "house")
                }
            TimeTableView()
                .tabItem {
                    Label("", systemImage: "calendar")
                }
            ZikirmatikView()
                .tabItem {
                    Label("", systemImage: "circle.dotted")
                }
            SettingsView()
                .tabItem {
                    Label("", systemImage: "gear")
                }
        }
        .accentColor(.brown)
//        .onAppear(perform: {
//            UITabBar.appearance().unselectedItemTintColor = .systemGray3
//            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)

//        })
    }
}

#Preview {
    PrayerTimeTabView()
}
