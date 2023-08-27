//
//  ChooseMedicineView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct ChooseMedicineView: View {
    @State var isSelected: [Bool] = Array(repeating: false, count: 5)
    let medColor = ["빨간색", "파란색", "보라색", "노란색", "초록색"]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                Text("총 5개의 의약품이\n인식되었어요")
                    .font(.pretendard(size: 26, .bold))
                    .padding(.horizontal, 24)
                    .padding(.vertical, 34)

                Image("screenshot")
                    .resizable()
                    .frame(width: 345, height: 345)
                    .padding(.horizontal, 24)
                DividingRectangle()
                    .padding(.top, 4)
                    .padding(.vertical, 28)
                SelectMedicineView()
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                VStack(alignment: .leading, spacing: 18) {
                    HStack(spacing: 20) {
                        MedicationSelectBox(isConfirmed: $isSelected[0], medColor: medColor[0], color: Color.theme.medicine.first, bgColor: Color.theme.medicine.first20)
                        MedicationSelectBox(isConfirmed: $isSelected[1], medColor: medColor[1], color: Color.theme.medicine.second, bgColor: Color.theme.medicine.second20)
                    }
                    HStack(spacing: 20) {
                        MedicationSelectBox(isConfirmed: $isSelected[2], medColor: medColor[2], color: Color.theme.medicine.third, bgColor: Color.theme.medicine.third20)
                        MedicationSelectBox(isConfirmed: $isSelected[3], medColor: medColor[3], color: Color.theme.medicine.temp, bgColor: Color.theme.medicine.temp20)
                    }
                    HStack(spacing: 20) {
                        MedicationSelectBox(isConfirmed: $isSelected[4], medColor: medColor[4], color: Color.theme.medicine.fourth, bgColor: Color.theme.medicine.fourth20)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
            }
        }
        .navigationTitle("나의 약 찾기")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ConfirmMedicineView()
                } label: {
                    Text("다음")
                }
            }
        }
    }
}
