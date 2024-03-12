import SwiftUI
@available(iOS 17.0, *)
struct GoalView: View {
    // MARK: Props
    
    // Controlling the page navigation.
    @State var nextView: Bool = false
    @State var preView: Bool = false
    
    // MARK: Animation Properties
    @State var backgroundOpacity = 0.0
    @State var navButtonOpacity = 0.0
    
    var body: some View {
        VStack{
            
            Spacer()
            HStack(spacing:110){
                    // The informational text which is appears on the center of the screen.
                InfoView(subtitle: "Goal of Sustainability", subtitleColor: .blue, title: "Water & Sanitation", titleSize: 35, bodyIsOn: true, bodyText:"Access to water, sanitation and hygiene is a human right. To get back on track, key strategies include capacity-building, promoting innovation and evidence-based action, and adopting a more integrated and holistic approach to water management. Nevertheless, countries face growing challenges linked to water scarcity, water pollution, degraded water-related ecosystems and cooperation over transboundary water basins.", bodyTextColor: .white, bodyTextSize: 20, bodyPaddingTop: 20, bodyWidth: 400
                )
               .offset(x: 10, y: 0)
                
                
                 // The brain symbol with blue background is assigned to the right side of the screen.
                VStack(alignment: .trailing) {
                        Image(systemName: "waterbottle.fill")
                            .font(.system(size: 120, weight: .bold, design: .default))
                    }
                .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                     .fill(Color.blue)
                        .frame(width: 270, height: 550)
                        .clipped(), alignment: .center)
                }
            
                .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                 .fill(Color.gray)
                    .frame(width: 700, height: 550)
                    .clipped(), alignment: .center)
                .opacity(backgroundOpacity)
                .basicEaseIn(delayCount: 0) {
                    backgroundOpacity = 1.0
                }
            
            
            Spacer()
            
            //MARK: Nav Button
            
            HStack(alignment: .bottom, spacing: 0) {
                
                Button("Back") {
                    withAnimation {
                        preView = true
                    }
                }
                .buttonStyle(NavButtonStyle(color: .gray))
                
                           Spacer()
                           Button("Go") {
                               withAnimation {
                                   nextView = true
                               }
                           }
                           .buttonStyle(NavButtonStyle(color: .blue))
                       }
                       .padding(.leading, 20)
                       .padding(.bottom, 30)
                       .opacity(navButtonOpacity)
                       .basicEaseIn(delayCount: 1, {
                           navButtonOpacity = 1.0
                       })

        }
        .navStack()
        .overlay(nextView ? SustainGoalView() : nil)
        .overlay(preView ? CO2MethodView() : nil)
        
    }
}
