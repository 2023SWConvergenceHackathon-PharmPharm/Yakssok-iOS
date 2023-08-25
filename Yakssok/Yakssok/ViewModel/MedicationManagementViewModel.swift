//
//  MedicationManagementViewModel.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import Foundation
import Combine

class MedicationManagementViewModel: ObservableObject {
    let publisher: PassthroughSubject<UUID, Never> = PassthroughSubject()
    
    @Published var medicineGroup: [MedicineGroup] = []
    
    init() {
        medicineGroup = MedicineGroup.dummyData
    }
    
    func doTakeMedicine(groupId: UUID, medicineId: UUID, index: Int) {
        guard let targetGroup = medicineGroup.first(where: { group in
            group.id == groupId
        }) else { return }
        
        print(targetGroup)
        
        guard let targetMedicine = targetGroup.medicines.first(where: { medicine in
            medicine.id == medicineId
        }) else { return }
        
        var newMedicine = targetMedicine
        newMedicine.takeCheckList[index] = !targetMedicine.takeCheckList[index]

        var newGroup = targetGroup
        
        guard let changeMedicineIdx = targetGroup.medicines.firstIndex(where: { medicine in
            medicine.id == medicineId
        }) else { return }
        
        newGroup.medicines[changeMedicineIdx] = newMedicine
        
        guard let changeGroupIdx = medicineGroup.firstIndex(where: { group in
            group.id == groupId
        }) else { return }
        
        medicineGroup[changeGroupIdx] = newGroup
        
        publisher.send(UUID())
    }
}
