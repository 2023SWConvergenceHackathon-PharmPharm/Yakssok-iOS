//
//  DURAlertView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/26.
//

import SwiftUI

struct DURAlertView: View {
    @State var deleting: Bool = false
    @State var levartDelete: Bool = false
    @State var normixDelete: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 3) {
                Text("잠시만요!")
                Text("같이 먹기 전 주의해주세요")
            }
            .font(.title1Bold)
            .padding(.bottom, 12)
            VStack(alignment: .leading, spacing: 3) {
                Text("아래 약들을 같이 먹을 경우")
                HStack(spacing: 0) {
                    Text("횡문근융해와 같은 중증의 근육이상이 보고")
                        .foregroundColor(Color.theme.primary.main)
                        .font(.body1SemiBold)
                    Text("되었어요.")
                }
                Text("꼭 전문가와 상의 후 복용하세요.")
            }
            .font(.body1)
            .padding(.bottom, 32)
            ZStack {
                MedicationBlock(medicationName: "levart", medicationKorName: "레바트정", medicationTag: ["위궤양", "급성위염"], color: Color.theme.medicine.third20)
                    .padding(.bottom, 20)
                if deleting {
                    Button {
                        withAnimation(.spring()) {
                            levartDelete = true
                        }
                    } label: {
                        DeleteButton()
                    }
                    .offset(x: UIScreen.main.bounds.width * 0.43, y: -UIScreen.main.bounds.height * 0.07)
                }
            }
            ZStack {
                MedicationBlock(medicationName: "normix", medicationKorName: "노르믹스정", medicationTag: ["설사"], color: Color.theme.medicine.fourth20)
                    .grayscale(normixDelete ? 0.5 : 0)
                    .opacity(normixDelete ? 0.3 : 1)
                if deleting {
                    Button {
                        withAnimation(.spring()) {
                            normixDelete.toggle()
                        }
                    } label: {
                        DeleteButton()
                            .rotationEffect(Angle(degrees: normixDelete ? 45 : 0))
                            .grayscale(normixDelete ? 1 : 0)
                            .brightness(normixDelete ? 0.2 : 0)
                    }
                    .offset(x: UIScreen.main.bounds.width * 0.43, y: -UIScreen.main.bounds.height * 0.06)
                }
            }
            Spacer()
            HStack(spacing: 25) {
                if !deleting {
                    Button {
                        withAnimation(.spring()) {
                            deleting = true
                        }
                    } label: {
                        Text("알약 삭제하기")
                            .padding(.vertical, 18)
                            .padding(.horizontal, 36)
                            .foregroundColor(.white)
                            .background(Color.theme.primary.main40)
                            .cornerRadius(12)
                    }
                }
                NavigationLink {
                    RecallAlertView()
                } label: {
                    Text("넘어갈게요")
                        .padding(.vertical, 18)
                        .padding(.horizontal, deleting ? 130 : 36)
                        .foregroundColor(Color.theme.primary.main40)
                        .background(Color.theme.primary.main10)
                        .cornerRadius(12)
                }
            }
            .font(.body1SemiBold)
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 24)
        .toolbar {
            NavigationLink {
                RecallAlertView()
            } label: {
                Text("다음")
            }
        }
        .navigationTitle(Text(""))
    }
}

struct DeleteButton: View {
    var body: some View {
        ZStack {
            Circle().fill(Color.theme.primary.main40)
                .frame(width: 33, height: 33)
            Image(systemName: "xmark")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

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

struct MedicationTag: View {
    let tagName: String
    let color: Color
    var body: some View {
        Text(tagName)
            .padding(.horizontal, 5)
            .padding(.vertical, 3)
            .background(color)
            .cornerRadius(6)
            .font(.caption1)
            .foregroundColor(Color.theme.gray.gray1)
    }
}

struct DURAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DURAlertView()
    }
}
