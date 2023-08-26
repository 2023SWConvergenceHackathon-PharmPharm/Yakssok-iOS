//
//  HowtoTakeView.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/27.
//

import SwiftUI

struct HowtoTakeComponent: View {
    @Binding var isDone: Bool
    @Binding var time: String
    @Binding var day: String
    @Binding var isSelect1: Bool
    @Binding var isSelect2: Bool

    let radius = 8.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 20) {
                Text("1일")
                HStack(spacing: 10) {
                    TextField("", text: $time)
                        .padding(.vertical, 11)
                        .padding(.horizontal, 14)
                        .frame(width: 45)
                        .background(
                            RoundedRectangle(cornerRadius: radius)
                                .stroke(ColorTheme().gray.gray5)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: time) { newValue in
                            
                            time = newValue.filter { "0123456789".contains($0) }
                        }
                    Text("회")
                }
                HStack(spacing: 10) {
                    TextField("", text: $day)
                        .padding(.vertical, 11)
                        .padding(.horizontal, 14)
                        .frame(width: 45)
                        .background(
                            RoundedRectangle(cornerRadius: radius)
                                .stroke(ColorTheme().gray.gray5)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: day) { newValue in
                            
                            day = newValue.filter { "0123456789".contains($0) }
                        }
                    Text("일분")
                }
            }
            HStack(spacing: 20) {
                TakeSetButton(isSelect: $isSelect1, label: "아침")
                TakeSetButton(isSelect: $isSelect1, label: "점심")
                TakeSetButton(isSelect: $isSelect1, label: "저녁")
            }
            HStack(spacing: 20) {
                TakeSetButton(isSelect: $isSelect1, label: "일어나자마자")
                HStack(spacing: 10) {
                    TakeSetButton(isSelect: $isSelect1, label: "자기 전")
                    Text("마다")
                }
            }
            HStack(spacing: 20) {
                TakeSetButton(isSelect: $isSelect2, label: "식전")
                TakeSetButton(isSelect: $isSelect2, label: "식후")
                HStack(spacing: 10) {
                    TakeSetButton(isSelect: $isSelect2, label: "식직후")
                    Text("에")
                }
            }
            Text("복용할게요")
        }
        .font(.title1Bold)
    }
}

struct TakeSetButton: View {
    @Binding var isSelect: Bool
    @State var isTapped = false
    let label: String
    let radius = 8.0
    
    var body: some View {
        Button {
            isTapped.toggle()
            isSelect = true
        } label: {
            Text(label)
                .foregroundColor(handleButtonLabel(isTapped))
                .padding(.vertical, 11)
                .padding(.horizontal, 14)
                .background(
                    RoundedRectangle(cornerRadius: radius)
                        .stroke(handleButtonStroke(isTapped))
                        .background(handleButtonColor(isTapped))
                )
        }
    }
    func handleButtonLabel (_ isTapped: Bool) -> Color {
        if isTapped {
            return ColorTheme().gray.black
        } else {
            return ColorTheme().gray
                .gray2
        }
    }
    
    func handleButtonStroke(_ isTapped: Bool) -> Color {
        if isTapped {
            return ColorTheme().primary.main40
        } else {
            return ColorTheme().gray.gray5
        }
    }
    
    func handleButtonColor(_ isTapped: Bool) -> Color {
        if isTapped {
            return ColorTheme().primary.main10
        } else {
            return Color.clear
        }
    }
}

struct HowtoTakeView_Previews: PreviewProvider {
    static var previews: some View {
        HowtoTakeView()
    }
}
