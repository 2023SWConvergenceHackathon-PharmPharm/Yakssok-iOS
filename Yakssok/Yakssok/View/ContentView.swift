//
//  ContentView.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var medicationManagementViewModel: MedicationManagementViewModel

    var body: some View {
        NavigationView {
            MainView()
                .environmentObject(medicationManagementViewModel)
        }
        .accentColor(.black)
        .navigationTitle("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(medicationManagementViewModel: MedicationManagementViewModel())
            .environmentObject(MedicationManagementViewModel())
    }
}
