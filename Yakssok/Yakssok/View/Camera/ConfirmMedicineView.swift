//
//  ConfirmMedicineView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct ConfirmMedicineView: View {
    @Binding var pageNum: Int
    @Binding var pillNum: Int
    @Binding var isConfirmed: Bool
    let pillListEn = ["red", "blue", "purple", "green"]
    let pillListKr = ["빨간색", "파란색", "보라색", "초록색"]
    let colorList = [Color.theme.medicine.first, Color.theme.medicine.second, Color.theme.medicine.third, Color.theme.medicine.fourth]
    let namespace: Namespace.ID
    
    var body: some View {
        ((Text(pillListKr[pillNum])+Text("테두리 의약품"))
            .foregroundColor(colorList[pillNum])+Text("과\n유사한 의약품을 찾아보았어요")
        )
            .font(.pretendard(size: 26, .bold))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
        
        Image(pillListEn[pillNum])
            .resizable()
            .frame(width: 137, height: 137)
            .padding(.horizontal, 128)
            .padding(.vertical, 16)
            .matchedGeometryEffect(id: "image", in: namespace)
        RoundedRectangle(cornerRadius: 12)
            .fill(isConfirmed ? Color.theme.primary.main : Color.theme.primary.main20)
            .frame(width: 128, height: 56)
            .overlay {
                Text(isConfirmed ? "Checked" : "체크해주세욥")
            }
            .onTapGesture {
                isConfirmed.toggle()
            }
    }
}
