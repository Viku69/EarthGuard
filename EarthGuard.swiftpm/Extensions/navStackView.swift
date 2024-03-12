import SwiftUI

// Custom Navigation View Properties
extension View {
    func navStack() -> some View {
        self
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
