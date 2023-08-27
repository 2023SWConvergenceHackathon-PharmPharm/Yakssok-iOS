//
//  CameraReconfirmView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct CameraReconfirmView: View {
//    @Binding var pageNum: Int
//    let namespace: Namespace.ID
    var body: some View {
        VStack {
            HStack{
                Text("아래 사진으로 검색할까요?")
                    .font(.pretendard(size: 26, .bold))
                    .padding(.bottom, 34)
//                    .frame(maxWidth: .infinity)
                Spacer()
            }
            Image("screenshot")
                .resizable()
                .frame(width: 345, height: 345)
                .padding(.horizontal, 24)
            Spacer()

            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.theme.primary.main20)
                    .frame(width: 160, height: 56)
                    .overlay {
                        Text("다시 촬영하기")
                            .foregroundColor(Color.theme.primary.main)
                            .font(.body1SemiBold)
                    }
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.theme.primary.main)
                    .frame(width: 160, height: 56)
                    .overlay {
                        NavigationLink {
                            ChooseMedicineView()
                        } label: {
                            Text("검색하기")
                                .foregroundColor(Color.theme.background.white)
                                .font(.body1SemiBold)
                        }

                    }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 24)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "xmark")
            }
        }
        .navigationTitle(Text(""))
        .navigationBarBackButtonHidden()
    }
}
