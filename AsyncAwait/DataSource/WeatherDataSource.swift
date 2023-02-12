//
//  WeatherDataSource.swift
//  AsyncAwait
//
//  Created by Manuel Rodriguez Sebastian on 12/2/23.
//

import Foundation
import CoreLocation
import Moya

class WeatherDataSource {
    private let provider = MoyaProvider<WeatherAPI>()
    
    func fetchWeather(location: CLLocation, successCallback: @escaping ((Weather) -> Void), errorCallback: @escaping ((Error) -> Void)) {
        provider.request(.currentWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)) { result in
            switch result {
            case .success(let response):
                do {
                    let weatherInfo = try JSONDecoder().decode(Weather.self, from: response.data)
                    successCallback(weatherInfo)
                } catch let error {
                    debugPrint(error)
                    errorCallback(error)
                }
            case .failure(let error): errorCallback(error)
            }
        }
    }
}
