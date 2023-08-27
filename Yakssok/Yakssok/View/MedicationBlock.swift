//
//  MedicationBlock.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct MedicationBlock: View {
    let medicationName: String
    let medicationKorName: String
    let medicationTag: [String]
    let color: Color
    var body: some View {
        NavigationLink {
            MedicineDetailView(medName: medicationKorName)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
                    .frame(maxWidth: .infinity)
                    .frame(height: 110)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(color)
                    )

                HStack(spacing: 8) {
                    Image(medicationName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 153)
                        .padding(.leading, 12)
                        .padding(.vertical, 10)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(medicationKorName)
                            .font(.body2SemiBold)
                            .foregroundColor(Color.theme.gray.gray1)
                            .padding(.bottom, 12)
                        HStack {
                            ForEach(medicationTag, id: \.self) { tag in
                                MedicationTag(tagName: tag, color: color)
                            }
                            Spacer()
                        }
                        .padding(.bottom, 12)
                        HStack(spacing: 3) {
                            Text("자세히 보기")
                            Image(systemName: "chevron.right")
                        }
                        .font(.caption2)
                        .foregroundColor(Color.theme.gray.gray2)
                    }
                    Spacer()
                }
            }
        }
    }
}


//struct MedicationBlock_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicationBlock()
//    }
//}
