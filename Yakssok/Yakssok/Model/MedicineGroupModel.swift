//
//  MedicineGroupModel.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import Foundation

struct MedicineGroup: Identifiable {
    let id: UUID
    let groupName: String
    var medicines: [ManagedMedicine]
    let isLongTerm: Bool
    let startDate: Date
    let endDate: Date
    
    static var dummyData: [MedicineGroup] {
        return [
            MedicineGroup(id: UUID(),
                          groupName: "오복희",
                          medicines: ManagedMedicine.longTermMedicines,
                          isLongTerm: true,
                          startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 6))!,
                          endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 8))!
                         ),
            MedicineGroup(id: UUID(),
                          groupName: "김순태",
                          medicines: ManagedMedicine.shortTermMedicines,
                          isLongTerm: false,
                          startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 23))!,
                          endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 29))!
                         )
        ]
    }
}
