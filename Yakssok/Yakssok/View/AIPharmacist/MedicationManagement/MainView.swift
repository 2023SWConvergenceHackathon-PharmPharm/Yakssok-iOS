//
//  MainView.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            header
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
                .padding(.top, 24)
            
            news
                .padding(.horizontal, 24)
                .padding(.bottom, 26)
            
            DateCalendarView()
                .padding(.bottom, 22)
            
            medicineGroupList
            
            Spacer()
        }
    }
}

extension MainView {
    private var header: some View {
        HStack {
            Image("")
                .frame(height: 29)
            
            Spacer()
            
            Button {
                // 약 추가하기
            } label: {
                HStack {
                    Image(systemName: "plus")
                        .font(.custom("SF Pro", size: 12))
                        .bold()
                    
                    Text("약 추가하기")
                        .font(.caption1SemiBold)
                }
                .foregroundColor(.theme.primary.main0)
                .frame(width: 89, height: 28)
                .background(Color.theme.primary.main40)
                .cornerRadius(8)
            }
        }
    }
    
    private var news: some View {
        HStack {
            Text("뉴스")
                .font(.caption1SemiBold)
                .padding(.leading, 12)
            
            Text("대웅제약 \"엔블로, 중동 진출...사우디아라비아에 품목허가신청\"")
                .font(.caption1)
                .padding(.trailing, 15)
        }
        .lineLimit(1)
        .padding(.vertical, 12)
        .foregroundColor(.theme.gray.black)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.theme.gray.gray5, lineWidth: 1)
        )
        .background(Color.theme.gray.gray6)

    }
    
    private var medicineGroupList: some View {
        VStack(spacing: 14) {
            MedicineGroupRow(isLongTerm: false)
                .padding(.horizontal, 24)
            
            MedicineGroupRow(isLongTerm: true)
                .padding(.horizontal, 24)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
