//
//  RegisterView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/27.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            HStack {
                Text("아래 사진으로 등록할까요?")
                    .font(.pretendard(size: 26, .bold))
                    .padding(.bottom, 34)
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
                            RegisterRecognizeView()
                        } label: {
                            Text("등록하기")
                                .foregroundColor(Color.theme.background.white)
                                .font(.body1SemiBold)
                        }
                    }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 24)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "xmark")
            }
        }
        .navigationTitle(Text(""))
        .navigationBarBackButtonHidden()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
