//
//  CameraReconfirmView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct CameraReconfirmView: View {
    @Binding var pageNum: Int
    let namespace: Namespace.ID
    
    var body: some View {
        Text("아래 사진으로 검색할까요?")
            .font(.pretendard(size: 26, .bold))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
        
        Image("screenshot")
            .resizable()
            .frame(width: 345, height: 345)
            .padding(24)
            .matchedGeometryEffect(id: "image", in: namespace)
        
        Spacer()
        
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.primary.main20)
                .frame(width: 160, height: 56)
                .overlay {
                    Text("다시 촬영하기")
                        .foregroundColor(Color.theme.primary.main)
                }
            Spacer()
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.primary.main)
                .frame(width: 160, height: 56)
                .overlay {
                    Text("검색하기")
                        .foregroundColor(Color.theme.background.white)
                }
                .onTapGesture {
                    pageNum = 1
                }
        }
        .padding(.horizontal, 24)
    }
}
