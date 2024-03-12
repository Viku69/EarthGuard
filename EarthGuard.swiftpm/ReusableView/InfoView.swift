import SwiftUI

struct InfoView: View {
    
    
    // MARK: Subtitle Props
    var subtitle: String
    var subtitleColor: Color

    // MARK: Title Props
    var title: String
    var titleSize: CGFloat
    
    // MARK: Body Text Props
    var bodyIsOn: Bool
    var bodyText: String
    var bodyTextColor: Color
    var bodyTextSize: CGFloat
    var bodyPaddingTop: CGFloat
    var bodyWidth: CGFloat
    
    // MARK: Animation Props
    @State var subtitleOpacity = 0.0
    @State var titleOpacity = 0.0
    @State var bodyTextOpacity = 0.0
    
    // MARK: View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            
            // Subtitle
            Text(subtitle)
                .font(.system(size: 25, weight: .semibold, design: .default))
                .foregroundColor(subtitleColor)
                .opacity(subtitleOpacity)
                .basicEaseIn(delayCount: 0) {
                    subtitleOpacity = 1.0
                }
            
            // Title
            Text(title)
                .font(.system(size: titleSize, weight: .bold, design: .default))
                .foregroundColor(Color.primary)
                .padding(.top, 5)
                .opacity(titleOpacity)
                .basicEaseIn(delayCount: 0.2) {
                    titleOpacity = 1.0
                }
            
            
            // Body Text Existance Control Point
            if bodyIsOn {
                // Body Text
                Text(bodyText)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(bodyTextColor)
                    .frame(width: bodyWidth, alignment: .leading)
                    .clipped()
                    .font(.system(size: bodyTextSize, weight: .medium, design: .default))
                    .padding(.top, bodyPaddingTop)
                    .opacity(bodyTextOpacity)
                    .basicEaseIn(delayCount: 0.4) {
                        bodyTextOpacity = 1.0
                    }
            }
        }
    }
    
}
