//
// CO2Emission.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class CO2EmissionInput : MLFeatureProvider {

    /// Make as string value
    var Make: String

    /// Engine Size(L) as double value
    var Engine_Size_L_: Double

    /// Cylinders as integer value
    var Cylinders: Int64

    var featureNames: Set<String> {
        get {
            return ["Make", "Engine Size(L)", "Cylinders"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "Make") {
            return MLFeatureValue(string: Make)
        }
        if (featureName == "Engine Size(L)") {
            return MLFeatureValue(double: Engine_Size_L_)
        }
        if (featureName == "Cylinders") {
            return MLFeatureValue(int64: Cylinders)
        }
        return nil
    }
    
    init(Make: String, Engine_Size_L_: Double, Cylinders: Int64) {
        self.Make = Make
        self.Engine_Size_L_ = Engine_Size_L_
        self.Cylinders = Cylinders
    }

}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class CO2EmissionOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// CO2 Emissions(g/km) as double value
     var CO2_Emissions_g_km_: Double {
        return self.provider.featureValue(for: "CO2 Emissions(g/km)")!.doubleValue
    }

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(CO2_Emissions_g_km_: Double) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["CO2 Emissions(g/km)" : MLFeatureValue(double: CO2_Emissions_g_km_)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class CO2Emission {
    let model: MLModel
    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "CO2Emission",withExtension:"mlmodelc")!
       
    }
    
//    class var urlOfModelInThisBundle : URL {
//        let resPath = Bundle(for: self).url(forResource: "CO2Emission",withExtension:"mlmodel")!
//        return try! MLModel.compileModel(at: resPath)
//
//    }
    
    /**
        Construct CO2Emission instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of CO2Emission.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `CO2Emission.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct CO2Emission instance by automatically loading the model from the app's bundle.
    */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct CO2Emission instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct CO2Emission instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<CO2Emission, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct CO2Emission instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> CO2Emission {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct CO2Emission instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<CO2Emission, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(CO2Emission(model: model)))
            }
        }
    }

    /**
        Construct CO2Emission instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> CO2Emission {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return CO2Emission(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as CO2EmissionInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CO2EmissionOutput
    */
    func prediction(input: CO2EmissionInput) throws -> CO2EmissionOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as CO2EmissionInput
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CO2EmissionOutput
    */
    func prediction(input: CO2EmissionInput, options: MLPredictionOptions) throws -> CO2EmissionOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return CO2EmissionOutput(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        - parameters:
           - input: the input to the prediction as CO2EmissionInput
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CO2EmissionOutput
    */
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    func prediction(input: CO2EmissionInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> CO2EmissionOutput {
        let outFeatures = try await model.prediction(from: input, options:options)
        return CO2EmissionOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - Make as string value
            - Engine_Size_L_ as double value
            - Cylinders as integer value

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CO2EmissionOutput
    */
    func prediction(Make: String, Engine_Size_L_: Double, Cylinders: Int64) throws -> CO2EmissionOutput {
        let input_ = CO2EmissionInput(Make: Make, Engine_Size_L_: Engine_Size_L_, Cylinders: Cylinders)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [CO2EmissionInput]
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [CO2EmissionOutput]
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [CO2EmissionInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [CO2EmissionOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [CO2EmissionOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  CO2EmissionOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
