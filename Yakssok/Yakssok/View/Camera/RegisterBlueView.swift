//
//  RegisterGoThroughView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct RegisterBlueView: View {
    let pillListEn = ["red", "blue", "purple", "yellow", "green"]
    let pillListKr = ["빨간색", "파란색", "보라색", "노란색", "초록색"]
    let colorList = [Color.theme.medicine.first, Color.theme.medicine.second, Color.theme.medicine.third, Color.theme.medicine.fourth]
    let accentColor = Color.theme.medicine.second20
    @State var bgColor: [Color] = [.clear, .clear, .clear, .clear, .clear, .clear]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Text("파란색 테두리 의약품")
                        .foregroundColor(Color.theme.medicine.second)
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
                Image(pillListEn[1])
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

                MedicationTempBlock(percent: 98, medicationName: "labela", medicationKorName: "라벨라정10mg", medicationTag: ["위궤양", "십이지장궤양"], bgColor: bgColor[0], strokeColor: Color.theme.medicine.fourth20)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [accentColor, .clear, .clear, .clear, .clear, .clear]
                    })

                MedicationTempBlock(percent: 97, medicationName: "demencept", medicationKorName: "디멘셉트정10mg", medicationTag: ["치매"], bgColor: bgColor[1], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, accentColor, .clear, .clear, .clear, .clear]
                    })
                MedicationTempBlock(percent: 96, medicationName: "labeprazol", medicationKorName: "비보존라베프라졸정10mg", medicationTag: ["위궤양", "십이지장궤양"], bgColor: bgColor[2], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, accentColor, .clear, .clear, .clear]
                    })
                MedicationTempBlock(percent: 95, medicationName: "olomax", medicationKorName: "올로맥스정40mg", medicationTag: ["고혈압", "고콜레스테롤"], bgColor: bgColor[3], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, .clear, accentColor, .clear, .clear]
                    })
                MedicationTempBlock(percent: 94, medicationName: "labefrin", medicationKorName: "라베프린정10mg", medicationTag: ["위궤양", "십이지장궤양"], bgColor: bgColor[4], strokeColor: accentColor)
                    .padding(.bottom, 18)
                    .padding(.horizontal, 24)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        bgColor = [.clear, .clear, .clear, .clear, accentColor, .clear]
                    })

                MedicationTempBlock(percent: 93, medicationName: "labesta", medicationKorName: "라베스타정20mg", medicationTag: ["위궤양", "십이지장궤양"], bgColor: bgColor[5], strokeColor: accentColor)
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
                    RegisterGreenView()
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

