//
//  ConfirmMedicineView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct ConfirmMedicineView: View {
    let pillListEn = ["red", "blue", "purple", "yellow", "green"]
    let pillListKr = ["빨간색", "파란색", "보라색", "노란색", "초록색"]
    let colorList = [Color.theme.medicine.first, Color.theme.medicine.second, Color.theme.medicine.third, Color.theme.medicine.fourth]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Text("빨간색 테두리 의약품")
                        .foregroundColor(Color.theme.medicine.first)
                    Text("과")
                }
                .padding(.horizontal, 24)
                .padding(.top, 34)
                .font(.title1Bold)
                .padding(.bottom, 4)
                Text("유사한 의약품을 찾아보았어요")
                    .font(.title1Bold)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 34)
                Image(pillListEn[0])
                    .resizable()
                    .frame(width: 137, height: 137)
                    .padding(.horizontal, 128)
                    .padding(.bottom, 32)

                MedicationTempBlock(percent: 98, medicationName: "orpyeon", medicationKorName: "올편제에스정", medicationTag: ["소화불량", "식욕감퇴"], bgColor: .clear, strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)

                MedicationTempBlock(percent: 97, medicationName: "decaferoll", medicationKorName: "비카페롤정", medicationTag: ["비타민D"], bgColor: .clear, strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)

                MedicationTempBlock(percent: 96, medicationName: "dexid", medicationKorName: "덱시드정480mg", medicationTag: ["당뇨병", "신경염"], bgColor: .clear, strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)

                MedicationTempBlock(percent: 95, medicationName: "weangel", medicationKorName: "위엔젤정", medicationTag: ["소화불량", "식욕감퇴"], bgColor: .clear, strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)

                MedicationTempBlock(percent: 94, medicationName: "digest", medicationKorName: "다이제스트정", medicationTag: ["소화불량", "식욕감퇴"], bgColor: .clear, strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)

                MedicationTempBlock(percent: 93, medicationName: "dkamax", medicationKorName: "디카맥스디정", medicationTag: ["비타민D"], bgColor: .clear, strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
            }
        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
        .navigationTitle("나의 약 찾기")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    RegisterView()
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }
    }
}
