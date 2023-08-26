//
//  TakeDoneView.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/27.
//

import SwiftUI

struct TakeDoneView: View {
    @State var name = "김경자"
    @State var isDone = false
    @State var isTapped1 = false
    @State var isTapped2 = false
    
    let leftButton = "chevron.left"
    let rightButton = "다음"
    let margin = 24.0
    let radius = 8.0
    
    var body: some View {
        NavigationView {
            VStack {
                if !isDone {
                    DoneCheckView()
                } else {
                    DoneEndView()
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
                    .disabled((isTapped1 == false) && (isTapped2 == false))
                }
            }
        }
    }
    
    func handlerightButtonColor() -> Color {
        if (isTapped1 == false) && (isTapped2 == false) {
            return ColorTheme().gray.gray4
        } else {
            return ColorTheme().gray.black
        }
    }
    
    func handleStrokeColor(_ isChanged: Bool) -> Color {
        if isChanged {
            return ColorTheme().primary.main40
        } else {
            return ColorTheme().gray.gray5
        }
    }
    
    private func handleSelectButtonLabel(_ isChanged: Binding<Bool>) -> Color {
        if isChanged.wrappedValue {
            return ColorTheme().gray.gray1
        } else {
            return ColorTheme().gray.gray3
        }
    }
    
    private func handleSelectButtonColor(_ isChanged: Binding<Bool>) -> Color {
        if isChanged.wrappedValue {
            return ColorTheme().primary.main10
        } else {
            return Color.clear
        }
    }
}

private extension TakeDoneView {
    
    enum SelectButton {
        case yes
        case no
        
        var label: String {
            switch self {
            case .yes:
                return "완료됐어요"
            case .no:
                return "아직이에요"
            }
        }
    }
    
    @ViewBuilder
    func DoneCheckView() -> some View {
        VStack(alignment: .leading, spacing: 48) {
            Text("\(name) 어르신의\n복용 일정이 완료되었나요?")
                .font(.title1Bold)
            HStack(spacing: 25) {
                selectButton($isTapped1, $isTapped2, SelectButton.no)
                    .background(
                        RoundedRectangle(cornerRadius: radius)
                            .stroke(handleStrokeColor(isTapped1))
                            .background(handleSelectButtonColor($isTapped1))
                    )
                selectButton($isTapped2, $isTapped1, SelectButton.yes)
                    .background(
                        RoundedRectangle(cornerRadius: radius)
                            .stroke(handleStrokeColor(isTapped2))
                            .background(handleSelectButtonColor($isTapped2))
                    )
            }
            Spacer()
            NextButton()
        }
    }
}

private extension TakeDoneView {
    
    @ViewBuilder
    func selectButton(_ isChanged1: Binding<Bool>, _ isChanged2: Binding<Bool>, _ buttonType: SelectButton) -> some View {
        Button {
                isChanged1.wrappedValue.toggle()
                isChanged2.wrappedValue = false
        } label: {
            Text(buttonType.label)
                .foregroundColor(handleSelectButtonLabel(isChanged1))
                .padding(.vertical, 16.5)
                .frame(maxWidth: .infinity)
        }
    }
}

private extension TakeDoneView {
    
    @ViewBuilder
    func NextButton() -> some View {
        Button {
            
        } label: {
            Text("다음")
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

private extension TakeDoneView {
    
    @ViewBuilder
    func DoneEndView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("\(name) 어르신의\n복약 일정을 종료했어요!")
                .font(.title1Bold)
                .foregroundColor(ColorTheme().gray.black)
            HStack(spacing: 0) {
                Text("약쏙")
                    .font(.body1SemiBold)
                    .foregroundColor(ColorTheme().primary.main40)
                Text("과 함께 건강해졌기를 바라요  😄")
                    .font(.body1)
                    .foregroundColor(ColorTheme().gray.gray1)
            }
            Spacer()
            NextButton()
        }
    }
}

struct TakeDoneView_Previews: PreviewProvider {
    static var previews: some View {
        TakeDoneView()
    }
}
