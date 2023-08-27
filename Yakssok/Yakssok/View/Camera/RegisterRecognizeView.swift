//
//  RegisterRecognizeView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct RegisterRecognizeView: View {
    @State var isSelected: [Bool] = Array(repeating: false, count: 5)
    let medColor = ["빨간색", "파란색", "보라색", "노란색", "초록색"]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("총 5개의 의약품이\n인식되었어요")
                .font(.pretendard(size: 26, .bold))
                .padding(.horizontal, 24)
                .padding(.vertical, 34)
            Image("screenshot")
                .resizable()
                .frame(width: 345, height: 345)
                .padding(.horizontal, 24)
            Spacer()
        }
        .navigationTitle("나의 약 등록하기")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    RegisterRedView()
                } label: {
                    Text("다음")
                }
            }
        }
    }
}

struct RegisterRecognizeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterRecognizeView()
    }
}
