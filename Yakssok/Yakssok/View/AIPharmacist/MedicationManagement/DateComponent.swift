//
//  DateComponent.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/25.
//

import SwiftUI

struct DateComponent: View {
    let date: Date
    @State var isDone: Bool
    @State var isToday: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 17, height: 17)
                    .foregroundColor(.theme.primary.main20)
                    .opacity(isToday ? 1 : 0)
                
                Text(getDay())
                    .foregroundColor(.theme.gray.gray1)
                    .font(.caption2)
            }
            .frame(width: 21, height: 21)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.theme.primary.main40)
                    .opacity(isDone ? 1 : 0)
                
                Text("\(getDateOfDay())")
                    .font(.body1SemiBold)
                    .foregroundColor(isDone ? .theme.gray.white : .theme.gray.black)
            }
            .frame(width: 32, height: 32)
        }
    }
    
    func getDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("E")
        dateFormatter.locale = Locale(identifier:"ko_KR")
        
        return dateFormatter.string(from: date)
      }
    
    func getDateOfDay() -> Int {
        return Calendar.current.component(.day, from: date)
    }
}

struct DateComponent_Previews: PreviewProvider {
    static var previews: some View {
        DateComponent(date: .now, isDone: true, isToday: true)
            .previewLayout(.sizeThatFits)
    }
}
