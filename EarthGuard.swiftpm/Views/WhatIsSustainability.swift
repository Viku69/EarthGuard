//
import SwiftUI
@available(iOS 17.0, *)

struct WhatIsSustainability: View {
    // MARK: Properties
       
       // Controlling the page navigation.
       @State var nextView: Bool = false
       @State var preView: Bool = false
       
       // MARK: Animation Properties
       @State var backgroundOpacity = 0.0
       @State var navButtonOpacity = 0.0
       
       // MARK: View
       
       var body: some View {
           VStack {
               Spacer()
               HStack(spacing:98){
                       // The informational text which is appears on the center of the screen.
                   InfoView(subtitle: "What is", subtitleColor: .green, title: "Sustainability", titleSize: 50, bodyIsOn: true, bodyText:"Sustainability means meeting the needs of the present without compromising the ability of future generations to meet their own needs. It involves balancing environmental, social, and economic factors to ensure long-term well-being for people and the planet.", bodyTextColor: .white, bodyTextSize: 20, bodyPaddingTop: 20, bodyWidth: 400
                   )
                  .offset(x: 10, y: 0)
                   
                   
                    // The brain symbol with blue background is assigned to the right side of the screen.
                   VStack(alignment: .trailing) {
                           Image(systemName: "globe.central.south.asia.fill")
                               .font(.system(size: 120, weight: .bold, design: .default))
                       }
                   .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                        .fill(Color.green)
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
               
               // Nav Button
               HStack(alignment: .bottom, spacing: 0) {
                   
                   Button("Back") {
                       withAnimation {
                           preView = true
                       }
                   }
                   .buttonStyle(NavButtonStyle(color: Color.gray))
                   
                   Spacer()
                   Button("Next") {
                       withAnimation {
                           nextView = true
                       }
                   }
                   .buttonStyle(NavButtonStyle(color: Color.blue))
               }
               .padding(.leading, 20)
               .padding(.bottom, 20)
               .opacity(navButtonOpacity)
               .basicEaseIn(delayCount: 0.6) {
                   navButtonOpacity = 1.0
               }
           }
           .navStack()
           .overlay(nextView ? AchieveSustainability() : nil)
           .overlay(preView ? WelcomeView() : nil)
       }
       
}
