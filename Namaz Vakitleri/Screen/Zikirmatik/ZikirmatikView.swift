//
//  ZikirMatikView.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import SwiftUI

struct ZikirmatikView: View {
    
    @State var zikirCount: Int = 0
    @State var activeSheet: ZikirViewButtonType?
    @State var selectZikir: String = ""
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Button {
                        activeSheet = .selectZikir
                    } label: {
                        ApplyButton(title: "Zikir Seç")
                            .fixedSize(horizontal: false, vertical: true)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                    }
                    
                    Button {
                        activeSheet = .savedZikir
                    } label: {
                        ApplyButton(title: "Kayıtlı Zikirlerim")
                            .fixedSize(horizontal: false, vertical: true)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                    }
                    
                    
                    Button {
                        activeSheet = .createZikir
                    } label: {
                        ApplyButton(title: "Zikir Oluştur")
                            .fixedSize(horizontal: false, vertical: true)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text(selectZikir)
                    .multilineTextAlignment(.center)
                    .font(.title)
                
                Spacer()
                
            }
            
            ZStack {
                Circle()
                    .stroke(.brown, lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.height / 3, height: UIScreen.main.bounds.height / 3)
                Button {
                    zikirCount += 1
                } label: {
                    Text(zikirCount == 0 ? "Başla" : String(zikirCount))
                        .font(.largeTitle)
                        .foregroundStyle(Color(.label))
                        .frame(width: UIScreen.main.bounds.height / 3, height: UIScreen.main.bounds.height / 3)
                }
            }
        }
        //        .background(
        //            Image("background")
        //        )
        .sheet(item: $activeSheet) { item in
            switch item {
            case .selectZikir:
                SelectZikirView().presentationCornerRadius(30)
            case .savedZikir:
                SavedZikirView().presentationCornerRadius(30)
            case .createZikir:
                CreateZikirView().presentationCornerRadius(30)
            }
        }
    }
}

#Preview {
    ZikirmatikView()
}

enum ZikirViewButtonType: Identifiable {
    case selectZikir, savedZikir, createZikir
    
    var id: Int {
        hashValue
    }
}
