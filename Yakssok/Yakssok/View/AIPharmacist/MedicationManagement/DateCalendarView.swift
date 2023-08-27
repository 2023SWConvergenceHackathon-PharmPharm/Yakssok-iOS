//
//  DateCalendarView.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/25.
//

import SwiftUI

struct DateCalendarView: View {
    @State var today: Int = 0

    var body: some View {
        VStack(alignment: .leading) {
            header
                .padding(.leading, 24)

            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(getListOfMonth(), id: \.self) { date in
                            let day = Calendar.current.component(.day, from: date)
                            
                            DateComponent(date: date, isDone: day < today, isToday: day == today)
                                .id(day)
                        }
                    }
                }
                .frame(height: 53)
                .onChange(of: today) { _ in
                    withAnimation {
                        proxy.scrollTo(today, anchor: .center)
                    }
                }
            }
        }
        .onAppear {
            today = getTodayDate()
        }
    }

    func getTodayDate() -> Int {
        let calendar = Calendar.current
        let now = Date.now

        return calendar.component(.day, from: now)
    }

    func getNowMonth() -> Int {
        let calendar = Calendar.current
        let now = Date.now

        return calendar.component(.month, from: now)
    }

    func getListOfMonth() -> [Date] {
        let calendar = Calendar.current

        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: .now))!

        let components = (
            0 ..< calendar.range(of: .day, in: .month, for: startDate)!.count)
            .map {
                calendar.date(byAdding: .day, value: $0, to: startDate)!
            }

        return components
    }
}

extension DateCalendarView {
    private var header: some View {
        Text("\(getNowMonth())월 기록")
            .font(.body1SemiBold)
            .foregroundColor(.theme.gray.black)
    }
}

struct DateCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        DateCalendarView()
    }
}
