//
//  SearchView.swift
//  Yakssok
//
//  Created by Jun on 2023/08/27.
//

import SwiftUI

struct SearchView: View {
    @State var pageNum: Int = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if pageNum == 0 {
                CameraReconfirmView(pageNum: $pageNum)
            }
            else if pageNum == 1 {
                ChooseMedicineView(pageNum: $pageNum)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
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
                        //.disabled(true)
                        .padding(.horizontal, 13)
                        .onTapGesture {
                            pageNum = 2
                        }
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
