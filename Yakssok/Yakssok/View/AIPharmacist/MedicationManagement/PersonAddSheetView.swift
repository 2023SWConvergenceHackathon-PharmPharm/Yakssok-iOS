//
//  PersonAddSheet.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/26.
//

import SwiftUI

struct PersonAddSheetView: View {
    @State var name = ""
    @State var isEditing = false
    @State var isDone = false
    @State var isTapped1 = false
    @State var isTapped2 = false
    
    let leftButton = "chevron.left"
    let rightButton = "다음"
    let title1 = "어르신의 이름은 무엇인가요?"
    let title2 = "병원에서 약을 처방받으셨나요?"
    let placeholder = "이름을 입력해주세요"
    let margin = 24.0
    let radius = 8.0
    
    var body: some View {
        NavigationView {
            VStack {
                if !isDone {
                    PersonTypeView()
                } else {
                    PrescriptionCheckView()
                }
                Spacer()
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
                            .disabled((name.isEmpty) && (isTapped1 == false) && (isTapped2 == false))
                    }
                }
            }
        }
    }
    
    func handleStrokeColor(_ isChanged: Bool) -> Color {
        if isChanged {
            return ColorTheme().primary.main40
        } else {
            return ColorTheme().gray.gray5
        }
    }
    
    func handlerightButtonColor() -> Color {
        if (name.isEmpty) && (isTapped1 == false) && (isTapped2 == false) {
            return ColorTheme().gray.gray4
        } else {
            return ColorTheme().gray.black
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
private extension PersonAddSheetView {
    
    @ViewBuilder
    func PersonTypeView() -> some View {
        VStack(alignment: .leading, spacing: 45) {
            Text(title1)
                .font(.title1Bold)
            
            TextField(placeholder, text: $name, onEditingChanged: { editing in
                self.isEditing = editing
            })
            .padding(.vertical, 15.5)
            .padding(.leading, 12)
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(handleStrokeColor(isEditing))
            )
        }
    }
}

private extension PersonAddSheetView {
    
    enum SelectButton {
        case no
        case yes
        
        var label: String {
            switch self {
            case .no:
                return "아니요"
            case .yes:
                return "받았어요"
            }
        }
    }
    
    @ViewBuilder
    func PrescriptionCheckView() -> some View {
        VStack(alignment: .leading, spacing: 45) {
            Text(title2)
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
        }
    }
}

private extension PersonAddSheetView {
    
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

struct PersonAddSheet_Previews: PreviewProvider {
    static var previews: some View {
        PersonAddSheetView()
    }
}
