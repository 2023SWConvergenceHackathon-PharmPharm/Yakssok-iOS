//
//  HowtoTakeSetView.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/27.
//

import SwiftUI

struct HowtoTakeView: View {
    @State var name = "김경숙"
    @State var time = ""
    @State var day = ""
    @State var isEditing = false
    @State var isDone = false
    @State var isSelect1 = false
    @State var isSelect2 = false
    
    let leftButton = "chevron.left"
    let rightButton = "다음"
    let margin = 24.0
    
    var body: some View {
        NavigationView {
            VStack {
                if !isDone {
                    HowtoTakeCheckView()
                } else {
                    HowtoTakeDoneView()
                }
            }
            .padding(.top, 60)
            .padding(.horizontal, margin)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isDone = false
                    } label: {
                        Image(systemName: leftButton)
                            .foregroundColor(ColorTheme().gray.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isDone = true
                    } label: {
                        Text(rightButton)
                            .font(.headlineSemiBold)
                            .foregroundColor(handlerightButtonColor())
                    }
                    .disabled(time.isEmpty || day.isEmpty || (isSelect1 == false) || (isSelect2 == false))
                }
            }
        }
    }
    
    func handlerightButtonColor() -> Color {
        if time.isEmpty || day.isEmpty || (isSelect1 == false) || (isSelect2 == false) {
            return ColorTheme().gray.gray4
        } else {
            return ColorTheme().gray.black
        }
    }
}

private extension HowtoTakeView {
    
    @ViewBuilder
    func HowtoTakeCheckView() -> some View {
        VStack(alignment: .leading, spacing: 45) {
            Text("\(name) 어르신의\n복용법을 선택해주세요")
                .font(.title1Bold)
            HowtoTakeComponent(isDone: $isDone, time: $time, day: $day, isSelect1: $isSelect1, isSelect2: $isSelect2)
            Spacer()
        }
    }
}

private extension HowtoTakeView {
    
    @ViewBuilder
    func HowtoTakeDoneView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("\(name) 어르신 등록이\n완료되었어요!")
                .font(.title1Bold)
            HStack(spacing: 0) {
                Text("약쏙")
                    .font(.body1SemiBold)
                    .foregroundColor(ColorTheme().primary.main40)
                Text("이 당신과 함께 어르신의 건강을 약속합니다 🤙🏻")
                    .font(.body1)
                    .foregroundColor(ColorTheme().gray.gray1)
            }
            Spacer()
            
            ConfirmButton()
        }
    }
}

private extension HowtoTakeView {
    
    @ViewBuilder
    func ConfirmButton() -> some View {
        Button {
            
        } label: {
            Text("확인")
                .font(.body1SemiBold)
                .foregroundColor(ColorTheme().background.white)
                .padding(.vertical, 18.5)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(ColorTheme().primary.main40)
                )
                
        }
        
    }
}


struct HowtoTakeSetView_Previews: PreviewProvider {
    static var previews: some View {
        HowtoTakeView(name: "김경숙")
    }
}

