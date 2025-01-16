//
//  CityWeatherView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct CityWeatherView: View {
    @StateObject var viewModel: CityWeatherVM
    @State private var tempUnits: TempUnit = .kelvin
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.cityName)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            HStack {
                Image(systemName: viewModel.weatherIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 20)
                
                VStack(alignment: .leading) {
                    Text(viewModel.weatherDescription)
                    //Text(viewModel.weatherIcon)
                    Text("Current Temp:")
                        .font(.title2)
                    Text(viewModel.formattedCurrentTemp(for: tempUnits))
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 20)
            
            HStack {
                Text("Min Temp:")
                    .font(.title2)
                Text(viewModel.formattedMinTemp(for: tempUnits))
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 20)
            
            HStack {
                Text("Max Temp:")
                    .font(.title2)
                Text(viewModel.formattedMaxTemp(for: tempUnits))
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 20)
            
            Button(action: {
                if (tempUnits == TempUnit.kelvin){
                    tempUnits = TempUnit.fahrenheit
                }else if (tempUnits == TempUnit.fahrenheit){
                    tempUnits = TempUnit.celsius
                }else if (tempUnits == TempUnit.celsius){
                    tempUnits = TempUnit.kelvin
                }
            }) {
                Text("Switch Temp Unit")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.3), in: RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}



struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView(viewModel: CityWeatherVM(model: Weather.example))
    }
}
