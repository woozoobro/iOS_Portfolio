//
//  ViewController.swift
//  Weather
//
//  Created by 우주형 on 2023/01/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var weatherStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = cityNameTextField.text {
            getCurrentWeather(cityName: cityName)
            
            view.endEditing(true)
        }
    }
    
    func configureView(weather: WeatherModel?) {
        if let weather = weather {
            self.cityNameLabel.text = weather.name
            self.weatherDescriptionLabel.text = weather.weather[0].description
            self.tempLabel.text = "\(weather.main.temp)°C"
            self.maxTempLabel.text = "최고: \(weather.main.maxTemp)°C"
            self.minTempLabel.text = "최저: \(weather.main.minTemp)°C"
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=dd9491c0574eb5226755f5e9dc0bad87&units=metric") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) {
                guard let weatherModel = try? decoder.decode(WeatherModel.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.weatherStackView.isHidden = false
                    self.configureView(weather: weatherModel)
                }
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                print(errorMessage)
                DispatchQueue.main.async {
                    self.showAlert(message: errorMessage.message)
                }
            }
        }.resume()
    }
    
}

