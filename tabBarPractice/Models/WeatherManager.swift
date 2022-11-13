//
//  WeatherManager.swift
//  tabBarPractice
//
//  Created by Batuhan Demircioğlu on 13.11.2022.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=5941c51e5e4a018b5c0f44a463ab4470&units=metric"
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            var weather = WeatherDisplay(conditionId: id, cityName: name, temperature: temp)
            
            
            
            print(weather.temperatureString)
        }
        catch {
            print(error)
        }
    }

}
