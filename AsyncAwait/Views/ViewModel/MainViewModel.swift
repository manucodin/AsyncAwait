//
//  MainViewModel.swift
//  AsyncAwait
//
//  Created by Manuel Rodriguez Sebastian on 12/2/23.
//

import Foundation
import CoreLocation

class MainViewModel {
    private let dataSource = WeatherDataSource()
    
    var madridWeatherInfo: Weather? = nil
    var madridWeatherInfoText: String {
        guard let mainText = madridWeatherInfo?.weather?.first?.main else { return "Cargando..." }

        return "Madrid - \(mainText)"
    }
    var madridTempText: String {
        guard let minText = madridWeatherInfo?.main?.tempMin else { return "Cargando..." }
        guard let maxText = madridWeatherInfo?.main?.tempMax else { return "Cargando..."}
        
        return "Temp. min \(minText)°C - Temp. max \(maxText)°C"
    }
    private let madridLocation = CLLocation(latitude: 40.416729, longitude: -3.703339)
    
    var barcelonaWeatherInfo: Weather? = nil
    var barcelonaWeatherInfoText: String {
        guard let mainText = barcelonaWeatherInfo?.weather?.first?.main else { return "Cargando..." }

        return "Madrid - \(mainText)"
    }
    var barcelonaTempText: String {
        guard let minText = barcelonaWeatherInfo?.main?.tempMin else { return "Cargando..." }
        guard let maxText = barcelonaWeatherInfo?.main?.tempMax else { return "Cargando..."}
        
        return "Temp. min \(minText)°C - Temp. max \(maxText)°C"
    }
    private let barcelonaLocation = CLLocation(latitude: 41.3887900, longitude: 2.1589900)
    
    var sevillaWeatherInfo: Weather? = nil
    var sevillaWeatherInfoText: String {
        guard let mainText = sevillaWeatherInfo?.weather?.first?.main else { return "Cargando..." }

        return "Madrid - \(mainText)"
    }
    var sevillaTempText: String {
        guard let minText = sevillaWeatherInfo?.main?.tempMin else { return "Cargando..." }
        guard let maxText = sevillaWeatherInfo?.main?.tempMax else { return "Cargando..."}
        
        return "Temp. min \(minText)°C - Temp. max \(maxText)°C"
    }
    private let sevillaLocation = CLLocation(latitude: 37.3828300, longitude: -5.9731700)
    
    func fetchWeatherInfo() async {
        do {
            async let madridInfo = dataSource.fetchWeather(location: madridLocation)
            async let barcelonaInfo = dataSource.fetchWeather(location: barcelonaLocation)
            async let sevillaInfo = dataSource.fetchWeather(location: sevillaLocation)
                        
            self.madridWeatherInfo = try await madridInfo
            self.barcelonaWeatherInfo = try await barcelonaInfo
            self.sevillaWeatherInfo = try await sevillaInfo
        } catch let error {
            debugPrint(error)
        }
    }
}
