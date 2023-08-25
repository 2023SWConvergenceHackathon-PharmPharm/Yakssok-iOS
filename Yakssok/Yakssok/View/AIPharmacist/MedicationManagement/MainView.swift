//
//  MainView.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/25.
//

import SwiftUI

struct MainView: View {
    // MARK: 뉴스 관련 변수
    let headlineSwitchTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State var newId: UUID = UUID()
    @State var newsIndex: Int = 0
    let newsHeadlines: [String] = [
        "대웅제약 \"엔블로, 중동 진출...사우디아라비아에 품목허가신청\"",
        "‘관리 사각’ 논란 선별급여 관리 강화…하반기 40여개 항목 적합성평가",
        "에스티큐브, 혁신 항암신약 후보 '넬마스토바트' 美 FDA 1b∙2상 IND 제출",
        "디지털치료기기‧인공지능(AI) 건강보험 등재 '가이드라인' 공개",
        "한림대동탄성심병원, 복지부 디지털헬스케어 실증사업에 2건 선정"
    ]
    
    // MARK: 약 관련
    @EnvironmentObject var medicationManagementViewModel: MedicationManagementViewModel
    
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
            
            Text(newsHeadlines[newsIndex])
                .font(.caption1)
                .padding(.trailing, 15)
                .transition(.moveAndFade)
                .animation(.easeIn(duration: 1), value: newsIndex)
                .onReceive(headlineSwitchTimer) { _ in
                    self.newsIndex = .random(in: 0...4)
                }
                .id(newsHeadlines[newsIndex])
            
            Spacer()
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
            ForEach(medicationManagementViewModel.medicineGroup, id: \.id) { group in
                MedicineGroupRow(managedMedicines: group.medicines, isLongTerm: group.isLongTerm, groupName: group.groupName, groupId: group.id)
                    .padding(.horizontal, 24)
                    .onReceive(medicationManagementViewModel.publisher) { id in
                        newId = id
                    }
                    .id(newId)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
