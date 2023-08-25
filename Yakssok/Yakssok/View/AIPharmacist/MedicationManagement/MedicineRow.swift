//
//  MedicineRow.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import SwiftUI

struct MedicineRow: View {
    @State var isDone = false
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                // 체크하셈
            } label: {
                Image(systemName: isDone ? "checkmark.circle.fill" : "checkmark.circle")
            }
            .padding(.trailing, 8)
            
            Image("")
                .clipShape(Circle())
                .frame(width: 32)
                .padding(.trailing, 9)
            
            Text("약 이름")
                .font(.caption1)
                .foregroundColor(.theme.gray.black)
            
            Spacer()
            
            Text(isDone ? "오후 5:12" : "")
                .font(.caption2SemiBold)
                .foregroundColor(.theme.gray.black)
        }
    }
}

struct MedicineRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineRow()
    }
}
