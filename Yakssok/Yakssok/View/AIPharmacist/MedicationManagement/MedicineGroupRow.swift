//
//  MedicineGroupRow.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import SwiftUI

struct MedicineGroupRow: View {
    let isLongTerm: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 0) {
                if isLongTerm {
                    Image(systemName: "pin.fill")
                        .font(.caption1SemiBold)
                        .foregroundColor(.theme.primary.main)
                        .padding(.trailing, 2)
                }
                
                Text("사용자 설정 이름")
                    .font(.caption1SemiBold)
                
                Spacer()
                
                Text("편집")
                    .foregroundColor(.theme.gray.gray2)
                    .font(.caption2)
            }
            
            ForEach(0..<2, id: \.self) { medicine in
                MedicineRow(isDone: .random())
            }
        }
        .padding(.all, 12)
        .background(Color.theme.gray.gray6)
        .cornerRadius(12)
    }
}

struct MedicineGroupRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineGroupRow(isLongTerm: false)
    }
}
