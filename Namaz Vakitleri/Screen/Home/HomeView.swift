//
//  HomeView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var timeRemaining: TimeInterval = 10// current ile vakit arasında kalan süre
    @State private var timer: Timer?
    @State private var isRunning: Bool = false
    
    var body: some View {
        ZStack {
            
            VStack {
                VStack( spacing: 20) {
                    HStack {
                        VStack {
                            Text("6 Mayıs Pazartesi")
                                .foregroundStyle(Color(.label))
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                            Divider().frame(width: 200)
                            Text("27 Şevval 1445")
                                .foregroundStyle(Color(.label))
                                .font(.title)
                        }
                    }
//                    .font(.title3)
                    HStack {
                        VStack {
                            Text("İmsak")
                            
                            Text("Güneş")
                            
                            Text("Öğle")
                            
                            Text("İkindi")
                            
                            Text("Akşam")
                            
                            Text("Yatsı")
                        }
                        
                        VStack {
                            Text("06:30")
                            
                            Text("06:30")
                            
                            Text("06:30")
                            
                            Text("06:30")
                            
                            Text("06:30")
                            
                            Text("06:30")
                            
                        }
                        
                        
                    }
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.label))
                    .padding()
                    
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(.clear)
//                .shadow(radius: 5)
                
                Spacer()
                
                VStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 1)
                            .opacity(0.3)
                        Circle()
                            .trim(from: 0, to: CGFloat(1 - (timeRemaining / 100))) // iki vakit arasında kalan süre
                            .stroke(Color.brown,style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                            .rotationEffect(.degrees(-90))
                        Text(formattedTime())
                            .font(.system(size: 45))
                    }
                }
                .frame(width: UIScreen.main.bounds.height / 3, height: UIScreen.main.bounds.height / 3)
                .padding(.bottom)
                
                Spacer()
                
            }
        }
        .onAppear{
            startTime()
        }
        .onDisappear {
            stopTime()
        }
    }
    
    private func formattedTime() -> String {
        let seconds = Int(timeRemaining) % 60
        let minutes = (Int(timeRemaining) / 60) % 60
        let hours = (Int(timeRemaining) / 3600)
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
    private func startTime() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTime()
            }
        })
    }
    
    private func stopTime() {
        isRunning = false
        timer?.invalidate()
        timeRemaining = 100
        startTime()
    }
}

#Preview {
    HomeView()
}
