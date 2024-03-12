import SwiftUI
import CoreML
@available(iOS 17.0, *)
struct AchieveSustainability: View {
    
    // MARK: Props
    
    // Controlling the page navigation.
    @State var nextView: Bool = false
    @State var preView: Bool = false
    
    // MARK: Animation Properties
    @State var backgroundOpacity = 0.0
    @State var navButtonOpacity = 0.0
    
    
    // MARK: View
    var body: some View {
        
        
        VStack{
            
            Spacer()
            HStack(spacing:98){
                    // The informational text which is appears on the center of the screen.
                InfoView(subtitle: "Know", subtitleColor: .red, title: "CO2 Emissions", titleSize: 50, bodyIsOn: true, bodyText:"CO2 is the main greenhouse gas produced by motor vehicles. CO2 emissions contribute to air pollution, exacerbating respiratory illnesses such as asthma and increasing the risk of cardiovascular diseases. Addressing vehicle emissions is crucial for mitigating climate change and improving public health. The CO2 emissions of a vehicle are measured in grams per km (g/km)", bodyTextColor: .white, bodyTextSize: 20, bodyPaddingTop: 20, bodyWidth: 400
                )
               .offset(x: 10, y: 0)
                
                
                 // The brain symbol with blue background is assigned to the right side of the screen.
                VStack(alignment: .trailing) {
                        Image(systemName: "car.circle")
                            .font(.system(size: 120, weight: .bold, design: .default))
                    }
                .background(RoundedRectangle(cornerRadius: 47, style: .continuous)
                     .fill(Color.red)
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
        .overlay(nextView ? CO2MethodView() : nil)
        .overlay(preView ? WhatIsSustainability() : nil)
        
    }
    
    
}
