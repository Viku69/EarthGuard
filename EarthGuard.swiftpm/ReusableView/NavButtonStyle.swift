import SwiftUI

// Reusable Style Configuration of Nav Button
struct NavButtonStyle: ButtonStyle {
    
    // MARK: Properties
    
    // Background color of navigation button
    var color: Color
    
    // MARK: Functions
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 60, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                            .fill(color)
                            .frame(width: 150, height: 50)
                            .clipped(), alignment: .center)
            .font(.system(size: 17, weight: .bold, design: .default))
            .foregroundColor(.white)
    }
    
}
