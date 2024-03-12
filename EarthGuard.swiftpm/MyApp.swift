import SwiftUI
import UIKit
import CoreML

@available(iOS 17.0, *)
@main
struct MyApp: App {
    
    @State private var showAlert = true
    
    var body: some Scene {
        WindowGroup {
           WelcomeView()
                .preferredColorScheme(.dark)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Device Alert"), 
                          message: Text("Please use this app in Ipad And Portrait Mode for the Best Experience."),
                          dismissButton: .default(Text("OK")))
                }
        }
    }
}
