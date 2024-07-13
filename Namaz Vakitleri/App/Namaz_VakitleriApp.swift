//
//  Namaz_VakitleriApp.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 2.05.2024.
//

import SwiftUI
//import Firebase

@main
struct Namaz_VakitleriApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}
