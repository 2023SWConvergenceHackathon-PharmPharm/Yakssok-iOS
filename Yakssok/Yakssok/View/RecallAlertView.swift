//
//  RecallAlertView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct RecallAlertView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 3) {
                Text("잠시만요!")
                Text("아래 약은 리콜 대상이에요")
            }
            .font(.title1Bold)
            .padding(.bottom, 12)
            .padding(.horizontal, 24)
            VStack(alignment: .leading, spacing: 3) {
                Text("NDMA 기준 초과에 따른 사전예방적 조치로 시중")
                    .foregroundColor(Color.theme.primary.main)
                    .font(.body1SemiBold)
                HStack(spacing: 0) {
                    Text("유통품에 대해 영업자 회수 조치")
                        .foregroundColor(Color.theme.primary.main)
                        .font(.body1SemiBold)
                    Text("가 이루어졌어요.")
                }
                Text("아래 약을 자동으로 복용 리스트에서 삭제할게요.")
            }
            .font(.body1)
            .padding(.bottom, 32)
            .padding(.horizontal, 24)

            MedicationBlock(medicationName: "labela", medicationKorName: "라벨라정", medicationTag: ["위궤양", "십이지장궤양"], color: Color.theme.medicine.second20)
                .padding(.horizontal, 24)

            DividingRectangle()
                .padding(.vertical, 28)
            Text("업체에 전화해서 리콜받을 수 있어요")
                .font(.title3SemiBold)
                .foregroundColor(Color.theme.gray.black)
                .padding(.horizontal, 24)
                .padding(.bottom, 12)
            Button {} label: {
                HStack(spacing: 4) {
                    Image(systemName: "phone.fill")
                    Text("통화")
                }
                .padding(.vertical, 18)
                .font(.body1SemiBold)
                .foregroundColor(Color.theme.primary.main40)
                .frame(maxWidth: .infinity)
                .background(Color.theme.primary.main10)
                .cornerRadius(12)
                .padding(.horizontal, 24)
            }
            Spacer()
        }
        .toolbar {
            NavigationLink {
                //                RecallAlertView()
            } label: {
                Text("다음")
            }
            .navigationTitle(Text(""))
        }
    }
}

struct RecallAlertView_Previews: PreviewProvider {
    static var previews: some View {
        RecallAlertView()
    }
}
