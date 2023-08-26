//
//  ChooseMedicineView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct ChooseMedicineView: View {
    @Binding var pageNum: Int
    let namespace: Namespace.ID
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 0) {
                Text("총 5개의 의약품이\n인식되었어요")
                    .font(.pretendard(size: 26, .bold))
                    .padding(.horizontal, 24)
                
                Image("screenshot")
                    .resizable()
                    .frame(width: 345, height: 345)
                    .padding(24)
                    .matchedGeometryEffect(id: "image", in: namespace)
                /*
                DividingRectangle()
                    .padding(.top, 4)
                    .padding(.bottom, 28)
                
                SelectMedicineView()
                    .padding(.horizontal, 24)
                */
            }
        }
    }
}
