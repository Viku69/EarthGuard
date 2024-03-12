import SwiftUI

// Reusable Style Configuration of ManageCard Button
    
// Reusable Style Configuration of Nav Button
struct ManageCard: ButtonStyle {
    
    // MARK: Properties
    
    // Background color of navigation button
    var color: Color
    
    // MARK: Functions
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 800, height: 160, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                            .fill(color)
                            .frame(width: 700, height: 100)
                            .clipped(), alignment: .center)
            .font(.system(size: 30, weight: .bold, design: .default))
            .foregroundColor(.white)
    }
    
}

