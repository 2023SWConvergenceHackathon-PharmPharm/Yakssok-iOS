//
//  SearchView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct SearchView: View {
    @Namespace var namespace
    @State var pageNum: Int = 0
    @State var pillNum: Int = 0
    @State var isConfirmed: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if pageNum == 0 {
                CameraReconfirmView(pageNum: $pageNum, namespace: namespace)
            }
            else if pageNum == 1 {
                ChooseMedicineView(pageNum: $pageNum, namespace: namespace)
            }
            else if pageNum == 2 {
                ConfirmMedicineView(pageNum: $pageNum, pillNum: $pillNum, isConfirmed: $isConfirmed, namespace: namespace)
            }
        }
        .padding(.top, 16)
        .animation(.spring(), value: pageNum)
        .navigationTitle(pageNum == 0 ? "" : "나의 약 찾기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if pageNum != 0 {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .font(.system(size:17))
                        .padding(.horizontal, 8)
                        .onTapGesture {
                            pageNum -= 1
                        }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if pageNum == 1 {
                    Text("다음")
                        .font(.headlineSemiBold)
                        .padding(.horizontal, 13)
                        .onTapGesture {
                            pageNum = 2
                        }
                }
                else if pageNum == 2 {
                    Text("다음")
                        .font(.headlineSemiBold)
                        .padding(.horizontal, 13)
                        .onTapGesture {
                            if pillNum == 3 {
                                pageNum += 1
                            }
                            else {
                                pillNum += 1
                                isConfirmed.toggle()
                            }
                        }
                        .disabled(!isConfirmed)
                        .foregroundColor(isConfirmed ? Color.theme.gray.black : Color.theme.gray.gray4)
                }
                else {
                    Image(systemName: "xmark")
                        .font(.system(size:17))
                        .padding(.horizontal, 8)
                }
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
