//
//  SearchMedicationView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/26.
//

import SwiftUI

struct SearchMedicationView: View {
    let medShape: [[String: String]] = [
        ["모양\n전체": ""],
        ["원형": "ShapeCircle"],
        ["타원형": "ShapeOval"],
        ["반원형": "ShapeSemiCircle"],
        ["장방형": "ShapeRectangle"],
        ["삼각형": "ShapeTriangle"],
        ["정방형": "ShapeSquare"],
        ["마름모형": "ShapeDiamond"],
        ["오각형": "ShapePentagon"],
        ["육각형": "ShapeHexagon"],
        ["팔각형": "ShapeOctagon"],
        ["기타": "ShapeEtc"],
    ]
    let medColor: [[String: String]] = [
        ["색상\n전체": ""],
        ["하양": "ColorWhite"],
        ["노랑": "ColorYellow"],
        ["주황": "ColorOrange"],
        ["분홍": "ColorPink"],
        ["빨강": "ColorRed"],
        ["갈색": "ColorBrown"],
        ["연두": "ColorYellowGreen"],
        ["초록": "ColorGreen"],
        ["청록": "ColorBlueGreen"],
        ["파랑": "ColorBlue"],
        ["남색": "ColorNavy"],
        ["자주": "ColorPurple"],
        ["보라": "ColorViolet"],
        ["회색": "ColorGray"],
        ["검정": "ColorBlack"],
        ["투명": "ColorTransparency"],
    ]
    let medFormulation: [[String: String]] = [
        ["제형\n전체": ""],
        ["정제류": "FormulationTablet"],
        ["경질캡슐": "FormulationHardCapsule"],
        ["연질캡슐": "FormulationSoftCapsule"],
    ]
    let medLine: [[String: String]] = [
        ["분할선\n  전체": ""],
        ["없음": "LineNone"],
        ["(-)형": "LineMinus"],
        ["(+)형": "LinePlus"],
        ["기타": "LineEtc"],
    ]
    @State var params: (medShape: String, medColor: String, medFormulation: String, medLine: String, identifier: String) = ("", "", "", "", "")
    @State var identifier = ""

    @State private var selectedKey: String = "" // YourKeyType는 dict의 key 타입에 맞게 변경해야 함

    func updateSelectedKey(type: String, key: String) {
        switch type{
        case "medShape":
            params.medShape = key
        case "medColor":
            params.medColor = key
        case "medFormulation":
            params.medFormulation = key
        case "medLine":
            params.medLine = key
        default:
            break
        }
//        selectedKey = key
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("약 모양으로 찾기")
                .font(.title1Bold)
                .padding(.horizontal, 24)
                .padding(.bottom, 8)
            Text("사진으로 인식하지 못했던 의약품을 모양으로 검색해요.")
                .font(.caption1)
                .padding(.bottom, 28)
                .padding(.horizontal, 24)
            DividingRectangle()
                .padding(.bottom, 28)
            categories(category: "모양\n전체", dict: medShape)
            categories(category: "색상\n전체", dict: medColor)
            categories(category: "제형\n전체", dict: medFormulation)
            categories(category: "분할선\n  전체", dict: medLine)
            HStack {
                Text("식별문자")
                    .font(.caption1)
                    .frame(width: 54)
                TextField("약의 앞면이나 뒷면의 문자를 적어주세요.", text: $identifier)
                    .font(.body2)
                    .foregroundColor(Color.theme.gray.gray2)
                    .padding(.vertical, 6)
                    .padding(.leading, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.theme.gray.gray5, lineWidth: 1)
                    )
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 28)

            HStack(spacing: 0) {
                Button {} label: {
                    Text("검색하기")
                        .font(.subheadlineSemiBold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.theme.primary.main40)
                .cornerRadius(12)
                .padding(.trailing, 14)
                Button {} label: {
                    HStack {
                        Text("초기화")
                        Image(systemName: "arrow.clockwise")
                    }
                    .font(.subheadlineSemiBold)
                    .foregroundColor(Color.theme.gray.gray2)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 22)
                }
                .background(Color.theme.gray.gray5)
                .cornerRadius(12)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 28)
            DividingRectangle()
        }
    }

    fileprivate func categories(category _: String, dict: [[String: String]]) -> some View {
        return HStack(spacing: 4) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(dict, id: \.self) { key in
                        VStack {
                            if key.map({ $0 }).first?.value == "" {
                                Text(key.map { $0 }.first?.key ?? "")
                                    .font(.caption1)
                                    .padding(.vertical, 10)
                                    .cornerRadius(4)
                            } else {
                                Image(key.map { $0 }.first?.value ?? "")
                                Text(key.map { $0 }.first?.key ?? "")
                                    .font(.caption1)
                            }
                        }
                        .onTapGesture {
                            if let tappedKey = key.map({ $0 }).first?.key {
                                switch tappedKey {
                                case "모양\n전체", "원형", "타원형":
                                    self.updateSelectedKey(type: "medShape", key: tappedKey)
                                case "색상\n전체", "하양", "노랑":
                                    self.updateSelectedKey(type: "medColor", key: tappedKey)
                                case "제형\n전체", "정제류", "경질캡슐":
                                    self.updateSelectedKey(type: "medFormulation", key: tappedKey)
                                case "분할선\n  전체", "없음", "(-)형":
                                    self.updateSelectedKey(type: "medLine", key: tappedKey)
                                default:
                                    self.updateSelectedKey(type: "medLine", key: "없음")
                                }
                                // 터치한 Text에 해당하는 key 값을 받아서 사용
//                                print("Tapped on image with key: \(tappedKey)")
                                print(params)
                                let values = [params.medShape, params.medColor, params.medFormulation, params.medLine]
                                print("values: \(values)")
                                print(values.contains("원형"))
//                                print(params.map{$0})
//                                self.updateSelectedKey(key: tappedKey)
                            }
                        }
                        .padding(.vertical, 6)
                        .frame(width: 54)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .strokeBorder(Color.theme.primary.main40)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.theme.primary.main40
                                            .opacity(
                                                params.medShape == key.map { $0 }.first?.key ? 0.2 : 0
//                                                params.medColor == key.map { $0 }.first?.key ? 0.2 : 0
//                                                params.medFormulation == key.map { $0 }.first?.key ? 0.2 : 0
//                                                params.medLine == key.map { $0 }.first?.key ? 0.2 : 0
                                            )
                                        )
                                )
                        )
                    }
                    .cornerRadius(4)
                }
                .padding(.trailing, 24)
            }
        }
        .padding(.leading, 24)
        .padding(.bottom, 12)
    }
}

struct DividingRectangle: View {
    var body: some View {
        Rectangle()
            .fill(Color.theme.gray.gray6)
            .frame(height: 12)
    }
}

struct SearchMedicationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMedicationView()
    }
}
