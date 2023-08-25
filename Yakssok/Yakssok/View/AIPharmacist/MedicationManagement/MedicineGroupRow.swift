//
//  MedicineGroupRow.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import SwiftUI

struct MedicineGroupRow: View {
    @State var managedMedicines: [ManagedMedicine]
    let isLongTerm: Bool
    let groupName: String
    let groupId: UUID
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 0) {
                if isLongTerm {
                    Image(systemName: "pin.fill")
                        .font(.caption1SemiBold)
                        .foregroundColor(.theme.primary.main)
                        .padding(.trailing, 2)
                }

                Text(groupName)
                    .font(.caption1SemiBold)
                
                Spacer()
                
                Text("편집")
                    .foregroundColor(.theme.gray.gray2)
                    .font(.caption2)
            }
            
            ForEach(managedMedicines, id: \.id) { medicine in
                MedicineRow(groupId: groupId, medicine: medicine)
            }
        }
        .padding(.all, 12)
        .background(Color.theme.gray.gray6)
        .cornerRadius(12)
    }
}
//
//struct MedicineGroupRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicineGroupRow(group: .constant(MedicineGroup(id: UUID(), medicines: [], isLongTerm: false, startDate: Date(), endDate: Date())), isLongTerm: false)
//    }
//}
