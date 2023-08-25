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
        TabView {
            NavigationStack {
                MainView()
                    .environmentObject(medicationManagementViewModel)
            }
            .tabItem {
                VStack {
                    Image(systemName: "pills.fill")
                    Text("나의 약")
                }
            }
            
            Text("지도")
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("지도")
                    }
                }
            
            Text("검색")
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("나의 약")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(medicationManagementViewModel: MedicationManagementViewModel())
            .environmentObject(MedicationManagementViewModel())
    }
}
