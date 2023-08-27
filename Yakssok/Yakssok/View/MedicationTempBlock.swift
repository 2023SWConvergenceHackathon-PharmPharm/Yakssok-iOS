//
//  MedicationTempBlock.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct MedicationTempBlock: View {
    let percent: Int
    let medicationName: String
    let medicationKorName: String
    let medicationTag: [String]
    let bgColor: Color
    let strokeColor: Color
    @State var isShow: Bool = false
    var body: some View {
//        NavigationLink {
//            MedicineDetailViewWithSubmitButton(medName: medicationKorName)
//        } label: {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(bgColor)
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(strokeColor)
                )

            HStack(spacing: 8) {
                Image(medicationName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 153)
                    .padding(.leading, 12)
                    .padding(.vertical, 10)
                VStack(alignment: .leading, spacing: 0) {
                    Text("유사도 \(percent)%")
                        .font(.caption1SemiBold)
                        .padding(.bottom, 4)
                        .foregroundColor(Color.theme.medicine.fourth)
                    Text(medicationKorName)
                        .font(.body2SemiBold)
                        .foregroundColor(Color.theme.gray.gray1)
                        .padding(.bottom, 10)
                    HStack {
                        ForEach(medicationTag, id: \.self) { tag in
                            MedicationTag(tagName: tag, color: strokeColor)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 10)
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
        .onTapGesture {
            isShow = true
        }
        .sheet(isPresented: $isShow) {
            MedicineDetailModalView(isShow: $isShow, medName: medicationKorName, percent: percent)
        }
//        }
    }
}
