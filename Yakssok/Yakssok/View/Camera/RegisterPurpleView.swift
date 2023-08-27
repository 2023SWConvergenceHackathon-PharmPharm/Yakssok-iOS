//
//  RegisterGoThroughView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct RegisterPurpleView: View {
    let pillListEn = ["red", "blue", "purple", "yellow", "green"]
    let pillListKr = ["빨간색", "파란색", "보라색", "노란색", "초록색"]
    let colorList = [Color.theme.medicine.first, Color.theme.medicine.second, Color.theme.medicine.third, Color.theme.medicine.fourth]
    let accentColor = Color.theme.medicine.third20
    @State var bgColor: [Color] = [.clear, .clear, .clear, .clear, .clear, .clear]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Text("보라색 테두리 의약품")
                        .foregroundColor(Color.theme.medicine.third)
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
                Image(pillListEn[2])
                    .resizable()
                    .frame(width: 137, height: 137)
                    .padding(.horizontal, 128)
                    .padding(.bottom, 32)
                HStack {
                    Spacer()
                    Text("선택 초기화")
                    Image(systemName: "arrow.clockwise")
                }
                .font(.caption1)
                .foregroundColor(Color.theme.gray.gray2)
                .padding(.bottom, 12)
                .padding(.trailing, 24)

                MedicationTempBlock(percent: 98, medicationName: "normix", medicationKorName: "노르믹스정", medicationTag: ["설사"], bgColor: bgColor[0], strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [accentColor, .clear, .clear, .clear, .clear, .clear]
                    })

                MedicationTempBlock(percent: 97, medicationName: "curokel", medicationKorName: "큐로켈정100mg", medicationTag: ["조현병", "양극성장애"], bgColor: bgColor[1], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, accentColor, .clear, .clear, .clear, .clear]
                    })
                MedicationTempBlock(percent: 96, medicationName: "pexonadin", medicationKorName: "펙소나딘정30mg", medicationTag: ["비염"], bgColor: bgColor[2], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, accentColor, .clear, .clear, .clear]
                    })
                MedicationTempBlock(percent: 95, medicationName: "mestinon", medicationKorName: "메스티논정", medicationTag: ["근무력증"], bgColor: bgColor[3], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, .clear, accentColor,  .clear, .clear]
                    })
                MedicationTempBlock(percent: 94, medicationName: "cevaco", medicationKorName: "세바코에이치씨티정5mg", medicationTag: ["고혈압"], bgColor: bgColor[4], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, .clear, .clear, accentColor, .clear]
                    })

                MedicationTempBlock(percent: 93, medicationName: "avezol", medicationKorName: "아베졸정20mg", medicationTag: ["위궤양", "십이지장궤양"], bgColor: bgColor[5], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, .clear, .clear, .clear, accentColor]
                    })

            }
        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
        .navigationTitle("나의 약 등록하기")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    DURAlertView()
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

