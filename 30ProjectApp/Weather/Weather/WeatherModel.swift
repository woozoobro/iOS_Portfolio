//
//  WeatherModel.swift
//  Weather
//
//  Created by 우주형 on 2023/01/07.
//

import Foundation

struct WeatherModel: Codable {
    let weather: [Weather]
    let main: Temp
    let name: String
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feelslike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelslike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
