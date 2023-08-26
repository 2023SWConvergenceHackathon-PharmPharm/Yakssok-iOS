//
//  ChooseMedicineView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct ChooseMedicineView: View {
    @Binding var pageNum: Int
    
    var body: some View {
        Text("총 5개의 의약품이\n인식되었어요")
            .font(.pretendard(size: 26, .bold))
        
        Image("screenshot")
            .resizable()
            .frame(width: 345, height: 345)
            .padding(.vertical, 24)
        
        Divider()
            .frame(height: 12)
            .padding(.horizontal, 28)
        SelectMedicineView()
    }
}

struct ChooseMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseMedicineView(pageNum: .constant(1))
    }
}
