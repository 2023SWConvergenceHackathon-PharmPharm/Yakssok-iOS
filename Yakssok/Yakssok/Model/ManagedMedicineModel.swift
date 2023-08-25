//
//  ManagedMedicineModel.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import Foundation

enum TakeTime {
    case breakfast
    case lunch
    case dinner
    case getUp
    case beforeSleep
    
    var description: String {
        switch self {
        case .breakfast:
            return "아침"
        case .lunch:
            return "점심"
        case .dinner:
            return "저녁"
        case .getUp:
            return "기상후"
        case .beforeSleep:
            return "취침전"
        }
    }
}

enum TakeTimingMethod {
    case beforeEat
    case afterEat
    case afterEatImmediately
    
    var description: String {
        switch self {
        case .beforeEat:
            return "식전 30분에 복용하세요."
        case .afterEat:
            return "식후 30분에 복용하세요."
        case .afterEatImmediately:
            return "식후 즉각 복용하세요."
        }
    }
}

struct ManagedMedicine: Identifiable {
    let id: UUID
    let medicine: Medicine
    let takeTime: [TakeTime]
    let takeTiming: [TakeTimingMethod]
    var takeCheckList: [Bool]
    
    init(id: UUID, medicine: Medicine, takeTime: [TakeTime], takeTiming: [TakeTimingMethod]) {
        self.id = id
        self.medicine = medicine
        self.takeTime = takeTime
        self.takeTiming = takeTiming
                
        var array: [Bool] = []
        for _ in 0..<takeTime.count {
            array.append(false)
        }

        self.takeCheckList = array
    }
    var isAllTaken: Bool {
        return takeCheckList.allSatisfy { check in
            return check
        }
    }
    
    var takeCount: Int {
        takeTime.count
    }
    
    static var longTermMedicines: [ManagedMedicine] {
        return [
            ManagedMedicine(id: UUID(),
                            medicine: Medicine.testMedicines[0],
                            takeTime: [.breakfast, .lunch, .dinner],
                            takeTiming: [.afterEat]
                           ),
            ManagedMedicine(id: UUID(),
                            medicine: Medicine.testMedicines[1],
                            takeTime: [.breakfast, .lunch, .dinner],
                            takeTiming: [.afterEat]
                           )
        ]
    }
    
    static var shortTermMedicines: [ManagedMedicine] {
        return [
            ManagedMedicine(id: UUID(),
                            medicine: Medicine.testMedicines[2],
                            takeTime: [.breakfast, .lunch, .dinner],
                            takeTiming: [.afterEat]
                           ),
            ManagedMedicine(id: UUID(),
                            medicine: Medicine.testMedicines[3],
                            takeTime: [.breakfast, .lunch, .dinner],
                            takeTiming: [.afterEat]
                           ),
            ManagedMedicine(id: UUID(),
                            medicine: Medicine.testMedicines[4],
                            takeTime: [.breakfast, .lunch, .dinner],
                            takeTiming: [.afterEat]
                           )
        ]
    }
}
