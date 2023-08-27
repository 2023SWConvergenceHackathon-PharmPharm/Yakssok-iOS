//
//  RegisterGoThroughView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct RegisterGreenView: View {
    let pillListEn = ["red", "blue", "purple", "yellow", "green"]
    let pillListKr = ["빨간색", "파란색", "보라색", "노란색", "초록색"]
    let colorList = [Color.theme.medicine.first, Color.theme.medicine.second, Color.theme.medicine.third, Color.theme.medicine.fourth]
    let accentColor = Color.theme.medicine.fourth20
    @State var bgColor: [Color] = [.clear, .clear, .clear, .clear, .clear, .clear]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Text("초록색 테두리 의약품")
                        .foregroundColor(Color.theme.medicine.fourth)
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
                Image(pillListEn[4])
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

                MedicationTempBlock(percent: 98, medicationName: "levart", medicationKorName: "레바트정", medicationTag: ["위궤양"], bgColor: bgColor[0], strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [accentColor, .clear, .clear, .clear, .clear, .clear]
                    })

                MedicationTempBlock(percent: 97, medicationName: "sorondo", medicationKorName: "소론도정", medicationTag: ["갑상선염", "관절염"], bgColor: bgColor[1], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, accentColor, .clear, .clear, .clear, .clear]
                    })
                MedicationTempBlock(percent: 96, medicationName: "indenol", medicationKorName: "인데놀정10mg", medicationTag: ["빈맥", "협심증"], bgColor: bgColor[2], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, accentColor, .clear, .clear, .clear]
                    })
                MedicationTempBlock(percent: 95, medicationName: "poributin", medicationKorName: "포리부틴정150mg", medicationTag: ["소화불량", "변비"], bgColor: bgColor[3], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, .clear, accentColor,  .clear, .clear]
                    })
                MedicationTempBlock(percent: 94, medicationName: "almagel", medicationKorName: "알마겔정", medicationTag: ["위염", "위산과다"], bgColor: bgColor[4], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, .clear, .clear, accentColor, .clear]
                    })

                MedicationTempBlock(percent: 93, medicationName: "turion", medicationKorName: "투리온정", medicationTag: ["두드러기"], bgColor: bgColor[5], strokeColor: accentColor)
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
                    RegisterPurpleView()
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

