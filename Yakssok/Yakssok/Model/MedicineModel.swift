//
//  MedicineModel.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import Foundation

struct Medicine: Identifiable {
    let id: String
    let name: String
    
    static var testMedicines: [Medicine] {
        return [
            Medicine(id: "aaaaa",
                     name: "안티푸라민"
                    ),
            Medicine(id: "bbbbb",
                     name: "타이레놀"
                    ),
            Medicine(id: "ccccc",
                     name: "레티마졸"
                    ),
            Medicine(id: "ddddd",
                     name: "라벨라정"
                    ),
            Medicine(id: "eeeee",
                     name: "가네리버"
                    ),
            Medicine(id: "fffff",
                     name: "고텍스"
                    )
        ]
    }
}
