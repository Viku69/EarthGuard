//
import SwiftUI
import CoreML
@available(iOS 17.0, *)
struct CO2MethodView: View {
    // MARK: Props
    
    @State private var Make = ""
    @State private var Engine_Size_L_ = ""
    @State private var Cylinders = ""
    @State private var predictedCO2: Double = 0.0

    
    // Controlling the page navigation.
    @State var nextView: Bool = false
    @State var preView: Bool = false
    
    // MARK: Animation Properties
    @State var backgroundOpacity = 0.0
    @State var navButtonOpacity = 0.0
    @State var textOpacity = 0.0
    @State var boolOpacity = 0.0
    
    
    func predictCO2() {
        
            textOpacity = 1.0
            boolOpacity = 1.0
            guard let engineSizeDouble = Double(Engine_Size_L_),
                  let cylindersInt = Int(Cylinders) else {
                return // Handle invalid input
            }
            
            // Load your Core ML model
            if let model = try? CO2Emission(configuration: MLModelConfiguration()) {
                do {
                    // Prepare input features
                    let inputFeatures =  CO2EmissionInput(Make: Make, Engine_Size_L_: engineSizeDouble, Cylinders: Int64(cylindersInt))
                    
                    // Perform prediction
                    let prediction = try model.prediction(input: inputFeatures)
                    
                    // Update predictedCO2 with the predicted value
                    predictedCO2 = prediction.CO2_Emissions_g_km_
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
                            Text("Enter Your Car Name")
                                .font(.title)
                                .bold()
                            TextField("BMW", text: $Make)
                                .textFieldStyle(.roundedBorder)
                                .disableAutocorrection(true)
                                .onChange(of: Make) { newValue in
                                    Make = newValue.uppercased()
                                }
                                
                                
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Enter Your Car Engine Size")
                                .font(.title)
                            TextField("Engine Size (L)", text: $Engine_Size_L_)
                                .textFieldStyle(.roundedBorder)
                                .autocorrectionDisabled()
                                .keyboardType(.decimalPad) // Allow decimal input for engine size
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Enter Your Car Engine Cylinders")
                                .font(.title)
                            TextField("Cylinders", text: $Cylinders)
                                .textFieldStyle(.roundedBorder)
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad) // Allow numeric input for cylinders
                        }
                        .padding()
                        
                        Button(action: predictCO2) {
                            Text("Predict CO2 Emissions")
                                .foregroundColor(.white)
                                .frame(width: 400, height: 70)
                                .background(RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.purple))
                        }
                        .padding(.bottom)
                        
                HStack{
                    Text("Predicted CO2 Emissions: ")
                        .padding()
                    Text("\(predictedCO2, specifier: "%.2f") g/km")
                        .frame(width: 200, height: 70)
                        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.purple))
                }
                
                }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding()
            
            
            Text("Use Public Transport Or Electric Vehicles to Reduce CO2 Emissions and Guard The Earth ")
                .padding()
                .foregroundStyle(.black)
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
        .overlay(nextView ? GoalView() : nil)
        .overlay(preView ? AchieveSustainability() : nil)
        
    }
}
