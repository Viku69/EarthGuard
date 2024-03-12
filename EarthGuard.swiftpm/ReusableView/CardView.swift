import SwiftUI

struct CardView: View {
    
    // MARK: Symbol Props
    var cardSymbolIsOn: Bool
    var cardSymbolName: String
    var cardSymbolSize: CGFloat
    var cardSymbolColor: Color
    var cardSymbolWidth: CGFloat
    var cardSymbolHeight: CGFloat
    
    // MARK: Subtitle Props
    var cardSubtitleIsOn: Bool
    var cardSubtitle: String
    var cardSubtitleSize: CGFloat
    var cardSubtitleColor: Color
    
    // MARK: Title Props
    var cardTitle: String
    var cardTitleSize: CGFloat
    var cardTitleColor: Color
    var paddingTop: CGFloat

    
    // MARK: Background Props
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var backgroundColor: Color
    
    // MARK: Animation Props
    var animationDuration: Double
    @State var cardOpacity = 0.0
    
    // MARK: View
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Card Symbol Existance Control Point
            if cardSymbolIsOn {

                // Symbol
                Image(systemName: cardSymbolName)
                    .imageScale(.large)
                    .font(.system(size: cardSymbolSize, weight: .semibold, design: .default))
                    .frame(width: cardSymbolWidth, height: cardSymbolHeight)
                    .clipped()
                    .foregroundColor(cardSymbolColor)
            }
            
            
            // Subtitle and Title.
            VStack(alignment: .leading) {
                
                // Card Subtitle Existance Control Point
                if cardSubtitleIsOn {
                    // Subtitle
                    Text(cardSubtitle)
                        .font(.system(size: cardSubtitleSize, weight: .semibold, design: .default))
                        .foregroundColor(cardSubtitleColor)
                        .padding(.top ,10)
                }
                
                // Title
                Text(cardTitle)
                    .font(.system(size: cardTitleSize, weight: .bold, design: .default))
                    .foregroundColor(cardTitleColor)
                    .padding(.top, paddingTop)
                    
            }
            .padding(.top , 20)
        }
        .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(backgroundColor)
                    .frame(width: width, height: height)
                    .clipped(), alignment: .center)
        .opacity(cardOpacity)
        .basicEaseIn(delayCount: animationDuration) {
            cardOpacity = 1.0
        }
    }
    
}
