//
//  AddGuideView.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/25.
//

import SwiftUI

struct AddGuideView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                header
                    .padding(.bottom, 19)
                
                title
                    .padding(.bottom, 12)
                
                content
                    .padding(.bottom, 20)
                    
                addButton
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            searchGuideButton
                .padding(.bottom, 76)
        }
    }
}

extension AddGuideView {
    private var header: some View {
        Image("")
            .frame(height: 29)
    }
    
    private var title: some View {
        Text("아직 복용 중인 약이 없어요")
            .font(.title1Bold)
            .foregroundColor(.theme.gray.black)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("병원에서 처방 받은 약이 있다면")
            HStack(alignment: .center, spacing: 0) {
                Text("약쏙")
                    .font(.body1SemiBold)
                    .foregroundColor(.theme.primary.main40)
                Text("에 등록해요.")
            }
        }
        .font(.body1)
    }
    
    private var addButton: some View {
        Button {
            // 넘어가기
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "plus")
                    .font(.custom("SF Pro", size: 12))
                    .foregroundColor(.theme.primary.main0)
                    .bold()
                
                Text("복용 중인 약 등록하기")
                    .font(.body1SemiBold)
                    .foregroundColor(.theme.gray.white)
            }
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(Color.theme.primary.main40)
            .cornerRadius(12)
        }
    }
    
    private var searchGuideButton: some View {
        HStack {
            VStack(spacing: 0) {
                Text("가지고 있는 약이 무슨 약인지 궁금하다면")
                Text("약 모양으로 찾기로 안내할게요")
            }
            .font(.body2)
            .padding(.trailing, 40)
            .padding(.vertical, 20)
            
            Image(systemName: "chevron.right")
                .font(.custom("SF Pro", size: 14))
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 74)
        .background(Color.theme.gray.gray6)
        .foregroundColor(.theme.gray.gray2)
    }
}

struct AddGuideView_Previews: PreviewProvider {
    static var previews: some View {
        AddGuideView()
    }
}
