//
//  MedicationSelectBox.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct MedicationSelectBox: View {
    @Binding var isConfirmed: Bool
    var medColor: String
    var color: Color
    var bgColor: Color
    var body: some View {
        Text("\(medColor) 테두리")
            .font(.body1SemiBold)
            .padding(.vertical, 16)
            .padding(.horizontal, 36)
            .foregroundColor(color)
            .background(isConfirmed ? bgColor : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(color)
            )
            .onTapGesture {
                isConfirmed.toggle()
            }
    }
}

struct MedicationSelectBox_Previews: PreviewProvider {
    static var previews: some View {
        MedicationSelectBox(isConfirmed: .constant(false), medColor: "빨간색", color: Color.theme.medicine.first, bgColor: Color.theme.medicine.first20)
    }
}
