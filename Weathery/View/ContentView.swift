//
//  ContentView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherDataViewModel()
    @State private var isShowingSheet = false
    @State private var inputCity = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView {
                    ForEach(viewModel.weatherData) { weather in
                        CityWeatherView(viewModel: CityWeatherVM(model: weather))
                    }
                }
                
                Button("Add City") {
                    isShowingSheet = true
                }
                .sheet(isPresented: $isShowingSheet) {
                    VStack {
                        Text("Enter City Name")
                            .font(.title)
                        TextField("City Name", text: $inputCity)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Get Weather Data") {
                            viewModel.getWeather(cityString: inputCity)
                            isShowingSheet = false
                        }
                        .padding()
                        .background(Color.blue, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.white)
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.getWeather(cityString: "Charlotte")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
