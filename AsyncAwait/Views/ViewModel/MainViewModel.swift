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
    
    func fetchWeatherInfo(completion: @escaping (() -> Void)) {
        fetchMadridWeather {
            self.fetchBarcelonaWeather {
                self.fetchSevillaWeather {
                    completion()
                }
            }
        }
    }
    
    private func fetchMadridWeather(completion: @escaping (() -> Void)) {
        dataSource.fetchWeather(location: madridLocation) { weatherInfo in
            self.madridWeatherInfo = weatherInfo
            completion()
        } errorCallback: { error in
            debugPrint(error)
        }
    }
    
    private func fetchBarcelonaWeather(completion: @escaping (() -> Void)) {
        dataSource.fetchWeather(location: barcelonaLocation) { weatherInfo in
            self.barcelonaWeatherInfo = weatherInfo
            completion()
        } errorCallback: { error in
            debugPrint(error)
        }
    }
    
    private func fetchSevillaWeather(completion: @escaping (() -> Void)) {
        dataSource.fetchWeather(location: sevillaLocation) { weatherInfo in
            self.sevillaWeatherInfo = weatherInfo
            completion()
        } errorCallback: { error in
            debugPrint(error)
        }
    }
}
