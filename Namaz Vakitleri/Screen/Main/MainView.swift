//
//  MainView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                if viewModel.isActive {
                    PrayerTimeTabView()
                } else {
                    SplashView()
                }
            }
        }
        .onAppear {
            viewModel.deneme()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.snappy) {
                    viewModel.isActive = true
                }
            }
        }
    }
}

#Preview {
    MainView()
}
