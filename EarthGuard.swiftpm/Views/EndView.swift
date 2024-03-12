import SwiftUI
@available(iOS 17.0, *)
struct EndView: View {
    
    // MARK: Properties
    
    // Controlling the page navigation.
    @State var nextView: Bool = false
    
    // MARK: Animation Properties
    @State var backgroundOpacity = 0.0
    @State var imageOpacity = 0.0
    @State var copyrightTextOpacity = 0.0
    @State var navigationButtonOpacity = 0.0
    
    // MARK: View
    
    var body: some View {
        VStack {
            
            Spacer()
            Spacer()
            Spacer()
            
            // The informational text which is appears on the top of the screen.
            InfoView(subtitle: " Swift Student Challenge 24", subtitleColor: .green, title: "Guarding the Earth | One Action at a Time", titleSize: 40, bodyIsOn: true, bodyText: "Your actions as an EarthGuardian have made a real impact on the virtual ecosystem. Let your experience inspire real-world environmental stewardship . Keep guarding the Earth for a brighter future!", bodyTextColor: .secondary, bodyTextSize: 20, bodyPaddingTop: 20, bodyWidth: 600)
            
            VStack(spacing: 25) {
                
                // "SeeYouSoonMemojies" Image
                Image("Vikram")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300 , alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    
                
                // Copyright Text
                Text("Developed with ❤️ by  Vikram Singh")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .opacity(copyrightTextOpacity)
                    .basicEaseIn(delayCount: 0.8) {
                        copyrightTextOpacity = 1.0
                    }
            }
            .padding(.top, 30)
            .opacity(backgroundOpacity)
            .basicEaseIn(delayCount: 0) {
                backgroundOpacity = 1.0
            }
            
            Spacer()
            
            // Navigation Button
            HStack(alignment: .bottom, spacing: 0) {
                Spacer()
                Button("Restart") {
                    withAnimation {
                        nextView = true
                    }
                }
                .buttonStyle(NavButtonStyle(color: .red))
            }
            .padding(.leading, 20)
            .padding(.bottom, 20)
            .opacity(navigationButtonOpacity)
            .basicEaseIn(delayCount: 1) {
                navigationButtonOpacity = 1.0
            }
        }
        .navStack()
        .overlay(nextView ? WelcomeView() : nil)
    }
    
}
