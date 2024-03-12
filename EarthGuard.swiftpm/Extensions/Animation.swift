import SwiftUI

// Reusable Custom "easeIn" Animation
public extension View {
    func basicEaseIn(using animation: Animation = Animation.easeIn(duration: 1), delayCount: Double, _ action: @escaping () -> Void) -> some View {
        let delay = animation.delay(delayCount)
        
        // Setting the animation action.
        return onAppear {
            withAnimation(delay) {
                action()
            }
        }
    }
    
}
