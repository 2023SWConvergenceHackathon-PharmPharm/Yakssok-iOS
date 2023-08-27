//
//  MedicineRow.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import SwiftUI

struct MedicineRow: View {
    @EnvironmentObject var medicationManagementViewModel: MedicationManagementViewModel
    @State var isDone = false
    let groupId: UUID
    @State var medicine: ManagedMedicine
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                // 체크하셈
            } label: {
                Image(systemName: medicine.isAllTaken ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor(Color.theme.primary.main40)
            }
            .padding(.trailing, 8)
            
            Image("")
                .clipShape(Circle())
                .frame(width: 32)
                .padding(.trailing, 9)
            
            Text(medicine.medicine.name)
                .font(.caption1)
                .foregroundColor(.theme.gray.black)
            
            Spacer()
            HStack(spacing: 8) {
                ForEach(Array(medicine.takeTime.enumerated()), id: \.1) { (index, time) in
                    Button {
                        // 약 먹음?
                        medicationManagementViewModel.doTakeMedicine(groupId: groupId, medicineId: medicine.id, index: index)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 41, height: 29)
                                .foregroundColor(medicine.takeCheckList[index] ? .theme.primary.main10 : .theme.background.white)
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(medicine.takeCheckList[index] ? Color.theme.primary.main40 : Color.theme.gray.gray5, lineWidth: 1))
                            
                            Text(time.description)
                                .font(.caption1)
                                .foregroundColor(.theme.gray.black)
                        }
                    }
                }
            }
        }
    }
}

struct MedicineRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineRow(groupId: UUID(), medicine: ManagedMedicine.shortTermMedicines[0])
            .environmentObject(MedicationManagementViewModel())
    }
}
