//
//  MainView.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/25.
//

import SwiftUI

struct MainView: View {
    // MARK: 약 관련
    @EnvironmentObject var medicationManagementViewModel: MedicationManagementViewModel
    
    // MARK: 뷰 관련
    @State var newId: UUID = UUID()
    @State var showModal: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                header
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                    .padding(.top, 24)
                
                DateCalendarView()
                    .padding(.bottom, 22)
                
                medicineGroupList
                
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showModal = true
                        } label: {
                            Image("ChatBotIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .padding(.trailing, 24)
                                .padding(.bottom, 32)
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showModal) {
            NavigationView {
                ChatBotMainView(showModal: $showModal)
                    .navigationTitle("AI 약사")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

extension MainView {
    private var header: some View {
        HStack(spacing: 10) {
            Image("Logo")
                .frame(height: 29)
            
            Spacer()
            
            NavigationLink {
                Text("검색뷰")
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.theme.primary.main0)
                    .padding(7)
                    .background(Color.theme.primary.main40)
                    .cornerRadius(8)
            }
            
            Button {
                // 약 추가하기
            } label: {
                HStack(spacing: 0) {
                    Image(systemName: "plus")
                        .font(.custom("SF Pro", size: 12))
                        .bold()
                    
                    Image(systemName: "person.fill")
                        .font(.custom("SF Pro", size: 12))
                        .bold()
                }
                .foregroundColor(.theme.primary.main0)
                .frame(width: 43, height: 28)
                .background(Color.theme.primary.main40)
                .cornerRadius(8)
            }
        }
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
