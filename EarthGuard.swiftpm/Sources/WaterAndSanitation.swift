//
// WaterAndSanitation.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class WaterAndSanitationInput : MLFeatureProvider {

    /// country as string value
    var country: String

    /// year as integer value
    var year: Int64

    var featureNames: Set<String> {
        get {
            return ["country", "year"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "country") {
            return MLFeatureValue(string: country)
        }
        if (featureName == "year") {
            return MLFeatureValue(int64: year)
        }
        return nil
    }
    
    init(country: String, year: Int64) {
        self.country = country
        self.year = year
    }

}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class WaterAndSanitationOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// goal_6_score as double value
    var goal_6_score: Double {
        return self.provider.featureValue(for: "goal_6_score")!.doubleValue
    }

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(goal_6_score: Double) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["goal_6_score" : MLFeatureValue(double: goal_6_score)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class WaterAndSanitation {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "WaterAndSanitation", withExtension:"mlmodelc")!
    }

    /**
        Construct WaterAndSanitation instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of WaterAndSanitation.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `WaterAndSanitation.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct WaterAndSanitation instance by automatically loading the model from the app's bundle.
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
        Construct WaterAndSanitation instance with explicit path to mlmodelc file
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
        Construct WaterAndSanitation instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<WaterAndSanitation, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct WaterAndSanitation instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> WaterAndSanitation {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct WaterAndSanitation instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<WaterAndSanitation, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(WaterAndSanitation(model: model)))
            }
        }
    }

    /**
        Construct WaterAndSanitation instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> WaterAndSanitation {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return WaterAndSanitation(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as WaterAndSanitationInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as WaterAndSanitationOutput
    */
    func prediction(input: WaterAndSanitationInput) throws -> WaterAndSanitationOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as WaterAndSanitationInput
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as WaterAndSanitationOutput
    */
    func prediction(input: WaterAndSanitationInput, options: MLPredictionOptions) throws -> WaterAndSanitationOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return WaterAndSanitationOutput(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        - parameters:
           - input: the input to the prediction as WaterAndSanitationInput
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as WaterAndSanitationOutput
    */
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    func prediction(input: WaterAndSanitationInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> WaterAndSanitationOutput {
        let outFeatures = try await model.prediction(from: input, options:options)
        return WaterAndSanitationOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - country as string value
            - year as integer value

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as WaterAndSanitationOutput
    */
    func prediction(country: String, year: Int64) throws -> WaterAndSanitationOutput {
        let input_ = WaterAndSanitationInput(country: country, year: year)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [WaterAndSanitationInput]
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [WaterAndSanitationOutput]
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [WaterAndSanitationInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [WaterAndSanitationOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [WaterAndSanitationOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  WaterAndSanitationOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
