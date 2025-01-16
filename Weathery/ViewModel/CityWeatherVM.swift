import Foundation

enum TempUnit {
    case kelvin, celsius, fahrenheit
}


class CityWeatherVM: ObservableObject{
    
    let model: Weather
    
    init(model: Weather){
        self.model = model
    }
    
    var weatherIcon: String {
        let icon_type = model.weather?.first?.icon
        //return model.weather?.first?.main ?? "No Weather"
        if (icon_type == "01n"){
            return "sun.max"
        }
        if (icon_type == "02n"){
            return "cloud.sun"
        }
        if (icon_type == "03n"){
            return "cloud"
        }
        if (icon_type == "04n"){
            return "cloud.sun"
        }
        if (icon_type == "09n"){
            return "cloud.rain"
        }
        if (icon_type == "10n"){
            return "cloud.rain"
        }
        if (icon_type == "11n"){
            return "cloud.bolt"
        }
        if (icon_type == "13n"){
            return "cloud.snow"
        }
        if (icon_type == "50n"){
            return "cloud.fog"
        }
        return ""
        
    }
    
    var cityName: String {
        return model.name ?? "No name"
    }
    var weatherDescription: String{
        return model.weather?.first?.weatherDescription ?? "No description"
    }
    
    func formattedCurrentTemp(for unit: TempUnit) -> String {
        guard let temp = model.main?.temp else { return "No temp" }
        switch unit {
        case .kelvin:
            return "\(temp)K"
        case .celsius:
            let celsius = temp - 273.15
            return String(format: "%.2f°C", celsius)
        case .fahrenheit:
            let fahrenheit = (temp - 273.15) * 9/5 + 32
            return String(format: "%.2f°F", fahrenheit)
        }
    }
    
    func formattedMinTemp(for unit: TempUnit) -> String {
        guard let tempMin = model.main?.tempMin else { return "No temp" }
        switch unit {
        case .kelvin:
            return "\(tempMin)K"
        case .celsius:
            let celsius = tempMin - 273.15
            return String(format: "%.2f°C", celsius)
        case .fahrenheit:
            let fahrenheit = (tempMin - 273.15) * 9/5 + 32
            return String(format: "%.2f°F", fahrenheit)
        }
    }
    
    func formattedMaxTemp(for unit: TempUnit) -> String {
        guard let tempMax = model.main?.tempMax else { return "No temp" }
        switch unit {
        case .kelvin:
            return "\(tempMax)K"
        case .celsius:
            let celsius = tempMax - 273.15
            return String(format: "%.2f°C", celsius)
        case .fahrenheit:
            let fahrenheit = (tempMax - 273.15) * 9/5 + 32
            return String(format: "%.2f°F", fahrenheit)
        }
    }
}
