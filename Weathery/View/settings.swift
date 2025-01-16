//
//  settings.swift
//  Weathery
//
//  Created by Luis Fajardo on 4/11/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var tempUnits: TempUnit
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Temperature Units", selection: $tempUnits) {
                    Text("Kelvin").tag(TempUnit.kelvin)
                    Text("Celsius").tag(TempUnit.celsius)
                    Text("Fahrenheit").tag(TempUnit.fahrenheit)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

