//
import SwiftUI

@available(iOS 17.0, *)
struct WelcomeView: View {
    
    // MARK: Props
    // Controlling the page navigation.
       @State var nextView: Bool = false
       
    // MARK: Animation Props
       @State var navButtonOpacity = 0.0
    
    // MARK: CardsScroll
    @Environment(\.verticalSizeClass) var verticalSizeClass
       
    // MARK: View
    var body: some View {
       
        VStack{
            
            Spacer()
            Spacer()
            
            VStack(alignment: .center, spacing: 0){
                InfoView( subtitle: "EarthGuard", subtitleColor: Color.green,title: "Welcome", titleSize: 60, bodyIsOn: true, bodyText: "Earthguard is here to teach you to become a guardian of the environment! 🌍", bodyTextColor: Color.secondary, bodyTextSize: 20, bodyPaddingTop: 20, bodyWidth:600)
                
                // MARK: Cards
                
                ScrollView(.horizontal , showsIndicators: false){
                    HStack{
                        // MARK: Sustainability
                         CardView(cardSymbolIsOn: true, cardSymbolName: "globe.central.south.asia.fill", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 100,cardSubtitleIsOn: true, cardSubtitle: "What is", cardSubtitleSize: 15, cardSubtitleColor: .white,  cardTitle: "Sustainability", cardTitleSize: 20, cardTitleColor: .white, paddingTop: 0,  width: 370, height: 250, cornerRadius: 40, backgroundColor: .green, animationDuration: 0.6)
                            .containerRelativeFrame(.horizontal ,  count: verticalSizeClass == .regular ? 2 : 4, spacing: 10)
                         
                        
                        CardView(cardSymbolIsOn: true, cardSymbolName: "leaf.fill", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 100,cardSubtitleIsOn: true, cardSubtitle: "How to achieve", cardSubtitleSize: 15, cardSubtitleColor: .white,  cardTitle: "Sustainability", cardTitleSize: 20, cardTitleColor: .white, paddingTop: 0,  width: 370, height: 250, cornerRadius: 40, backgroundColor: .pink, animationDuration: 0.6)
                           .containerRelativeFrame(.horizontal ,  count: verticalSizeClass == .regular ? 2 : 4, spacing: 10)
                        
                        CardView(cardSymbolIsOn: true, cardSymbolName: "drop.degreesign.fill", cardSymbolSize: 70, cardSymbolColor: .white, cardSymbolWidth: 100, cardSymbolHeight: 100,cardSubtitleIsOn: true, cardSubtitle: "Get Ready to Save", cardSubtitleSize: 15, cardSubtitleColor: .white,  cardTitle: "Earth", cardTitleSize: 20, cardTitleColor: .white, paddingTop: 0,  width: 370, height: 250, cornerRadius: 40, backgroundColor: .blue, animationDuration: 0.6)
                           .containerRelativeFrame(.horizontal ,  count: verticalSizeClass == .regular ? 2 : 4, spacing: 8)
                    }
                    .scrollTargetLayout()
                    .frame(height: 500)
                }
                .contentMargins(16 , for: .scrollContent)
                .scrollTargetBehavior(.paging)
                //.padding(.top , 10)
            }
            
            
            Spacer()
            
            //MARK: Nav Button
            
            HStack(alignment: .bottom, spacing: 0) {
                
                           Spacer()
                           Button("Let's Start") {
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
        .overlay(nextView ? WhatIsSustainability() : nil)
        
    }
}
