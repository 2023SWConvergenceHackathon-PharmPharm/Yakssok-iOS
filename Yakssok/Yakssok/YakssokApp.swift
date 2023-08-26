//
//  YakssokApp.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/24.
//

import SwiftUI

@main
struct YakssokApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(medicationManagementViewModel: MedicationManagementViewModel())
//            MedicineDetailView()
//                .environmentObject(Medication())
        }
    }
}
