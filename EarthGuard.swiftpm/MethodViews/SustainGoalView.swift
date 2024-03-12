//
//  File.swift
//  
//
//  Created by Vikram Singh on 20/02/24.
//

//
import SwiftUI
import CoreML
@available(iOS 17.0, *)
struct SustainGoalView: View {
    // MARK: Props
    
    @State private var country = ""
    @State private var year = ""
    @State private var predictedGoal: Double = 0.0

    
    // Controlling the page navigation.
    @State var nextView: Bool = false
    @State var preView: Bool = false
    
    // MARK: Animation Properties
    @State var backgroundOpacity = 0.0
    @State var navButtonOpacity = 0.0
    @State var textOpacity = 0.0
    @State var boolOpacity = 0.0
    
    
    func predictGoal() {
        
            textOpacity = 1.0
            boolOpacity = 1.0
            guard let yearsInt = Int(year) else {
                return // Handle invalid input
            }
            
            // Load your Core ML model
            if let model = try? WaterAndSanitation(configuration: MLModelConfiguration()) {
                do {
                    // Prepare input features
                    let inputFeatures =  WaterAndSanitationInput(country: country, year: Int64(yearsInt))
                    
                    // Perform prediction
                    let prediction = try model.prediction(input: inputFeatures)
                    
                    // Update predictedCO2 with the predicted value
                    predictedGoal = prediction.goal_6_score
                } catch {
                    print("Error making prediction: \(error.localizedDescription)")
                }
            } else {
                print("Error loading Core ML model")
            }
        }

    // MARK: View
    var body: some View {
        
        VStack{
            
            Spacer()
            VStack{
                VStack(alignment: .leading) {
                            Text("Enter Your Country Name")
                                .font(.title)
                                .bold()
                            TextField("India", text: $country)
                                .textFieldStyle(.roundedBorder)
                                .disableAutocorrection(true)
                                .onChange(of: country) { newValue in
                                    country = newValue.capitalized
                                }
                                .textInputAutocapitalization(.words)
                                
                                
                        }
                        .padding()
                        
                        
                        VStack(alignment: .leading) {
                            Text("Enter Year")
                                .font(.title)
                            TextField("Year", text: $year)
                                .textFieldStyle(.roundedBorder)
                                .autocorrectionDisabled()
                        }
                        .padding()
                        
                        Button(action: predictGoal) {
                            Text("Predict Water And Sanitation Score")
                                .foregroundColor(.white)
                                .frame(width: 400, height: 70)
                                .background(RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.orange))
                        }
                        .padding(.bottom)
                        
                HStack{
                    Text("Predicted Score Out Of 100 , According to the dataset Of U.N. is : ")
                        .padding()
                    Text("\(predictedGoal, specifier: "%.2f")")
                         .frame(width: 100, height: 70)
                         .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.orange))
                }
                
                }
            .font(.title)
            .padding()
            
            
            Text("IMPROVE WATER QUALITY, WASTEWATER TREATMENT AND SAFE REUSE")
                .foregroundStyle(.black)
                .padding()
                .multilineTextAlignment(.center)
                .frame(width: 750 , height: 100)
                .background(RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.yellow))
                .font(.title)
                .bold()
                .opacity(textOpacity)
            
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
                           Button("Next") {
                               withAnimation {
                                   nextView = true
                               }
                           }
                           .opacity(boolOpacity)
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
        .overlay(nextView ? EndView() : nil)
        .overlay(preView ? GoalView() : nil)
        
    }
}
