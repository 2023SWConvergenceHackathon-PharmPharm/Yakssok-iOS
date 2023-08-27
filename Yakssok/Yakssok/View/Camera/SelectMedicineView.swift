//
//  SelectMedicineView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct SelectMedicineView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("카메라 검색은 알약 하나씩 검색할 수 있어요")
                .font(.title3SemiBold)
            Text("검색할 알약 하나를 선택해주세요.")
                .font(.body1)
        }
    }
}

struct SelectMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        SelectMedicineView()
    }
}
