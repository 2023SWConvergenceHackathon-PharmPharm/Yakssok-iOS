//
//  MedicationModel.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/25.
//

import Foundation
import SwiftSoup
import SwiftUI

struct SearchResponse: Codable {
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let link: String
    let description: String
    let thumbnail: String?
}

class Medication: ObservableObject {
    @Published var medicationDetail: [String: String] = [:]

    func fetchSearchResults() {
        let clientId = "6wpJZeMpZr7peQLXETL5"
        let clientSecret = "6eAMN4y7nY"
        let query = "메티마졸"
        let urlString = "https://openapi.naver.com/v1/search/encyc.json?query=\(query)&display=10&start=1"

        var itemLink = ""
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            var request = URLRequest(url: url)
            request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
            request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let searchResponse = try decoder.decode(SearchResponse.self, from: data)

                        if let firstItemLink = searchResponse.items.first?.link {
                            itemLink = firstItemLink
                            self.fetchMedicineDetails(detailLink: itemLink)
                        } else {
                            print("No items found")
                        }
                    } catch {
                        print("Decoding error: \(error)")
                    }
                } else {
                    print("No data received")
                    return
                }
            }.resume()
        } else {
            print("error")
        }
    }

    func fetchMedicineDetails(detailLink: String) {
        if let url = URL(string: detailLink) {
            do {
                let html = try String(contentsOf: url)
                let doc = try SwiftSoup.parse(html)

                // 효능효과 추출
                if let element = try doc.select("meta[property=og:description]").first() {
                    let description = try element.attr("content")
                    extractText(description: description)
                }

                // 이미지 링크 추출
                if let imgElement = try doc.select("img[origin_src]").first() {
                    let originSrc = try imgElement.attr("origin_src")
                    medicationDetail["medImage"] = originSrc
                }

                // 세부사항 추출
                let tmpProfileDiv: Element? = try doc.select("div.tmp_profile").first()
                let temp = try tmpProfileDiv!.select("table").text()
                extractDescription(description: temp)

                // 용법용량 조건부 추출
                if let startElement = try doc.select("h3#TABLE_OF_CONTENT4").first(),
                   let endElement = try doc.select("h3#TABLE_OF_CONTENT5").first()
                {
                    if try startElement.text() == "용법용량" {
                        var extractedText = ""
                        var currentElement = try startElement.nextElementSibling()

                        while currentElement != nil && currentElement != endElement {
                            extractedText += try currentElement!.text() + "\n"
                            currentElement = try currentElement?.nextElementSibling()
                        }
                        medicationDetail["용법용량"] = extractedText
                    }
                }
                if let startElement = try doc.select("h3#TABLE_OF_CONTENT5").first(),
                   let endElement = try doc.select("h3#TABLE_OF_CONTENT6").first()
                {
                    if try startElement.text() == "용법용량" {
                        var extractedText = ""
                        var currentElement = try startElement.nextElementSibling()

                        while currentElement != nil && currentElement != endElement {
                            extractedText += try currentElement!.text() + "\n"
                            currentElement = try currentElement?.nextElementSibling()
                        }
                        medicationDetail["용법용량"] = extractedText
                    }
                }
            } catch {
                print("HTML parsing error: \(error)")
            }
        }
    }

    func extractDescription(description: String) {
        // 식약처 분류 추출
        if let classificationRange = description.range(of: "식약처 분류"),
           let classificationEndRange = description.range(of: "구분")
        {
            let classification = description[classificationRange.upperBound ..< classificationEndRange.lowerBound].trimmingCharacters(in: .whitespacesAndNewlines)
            medicationDetail["식약처 분류"] = classification
        }

        // 구분 추출
        if let typeRange = description.range(of: "구분"),
           let manufacturerRange = description.range(of: "제조(수입) 업체명")
        {
            let type = description[typeRange.upperBound ..< manufacturerRange.lowerBound].trimmingCharacters(in: .whitespacesAndNewlines)
            medicationDetail["구분"] = type
        }

        // 제조(수입) 업체명 추출
        if let manufacturerRange = description.range(of: "제조(수입) 업체명"),
           let importTypeRange = description.range(of: "제조·수입 구분")
        {
            let manufacturer = description[manufacturerRange.upperBound ..< importTypeRange.lowerBound].trimmingCharacters(in: .whitespacesAndNewlines)
            medicationDetail["제조(수입) 업체명"] = manufacturer
        }

        // 제조·수입 구분 추출
        if let importTypeRange = description.range(of: "제조·수입 구분"),
           let insuranceCodeRange = description.range(of: "보험코드")
        {
            let importType = description[importTypeRange.upperBound ..< insuranceCodeRange.lowerBound].trimmingCharacters(in: .whitespacesAndNewlines)
            medicationDetail["제조·수입 구분"] = importType
        }
    }

    func extractText(description: String) {
        if let startIndex = description.range(of: "[효능효과]")?.upperBound,
           let endIndex = description.range(of: "[용법용량]")?.lowerBound
        {
            let extractedText = description[startIndex ..< endIndex].trimmingCharacters(in: .whitespacesAndNewlines)
            let processedText = extractedText.split(separator: " - ").map { $0 }.joined(separator: ", ").split(separator: "- ").map { $0 }.joined()
            medicationDetail["효능효과"] = extractAndPrintItems(from: processedText)
        }
    }

    func extractAndPrintItems(from text: String) -> String {
        let components = text.components(separatedBy: CharacterSet.decimalDigits.inverted)
        let items = components.filter { !$0.isEmpty }
        let separators = CharacterSet(charactersIn: items.joined())
        var returnArr = [String]()
        // 숫자로 나뉜 경우 가공해서 리턴
        if text.contains(try! Regex("[0-9]")) {
            for i in items.enumerated() {
                returnArr.append("\(i.element)\(text.components(separatedBy: separators)[Int(i.element) ?? 0])")
            }
            return returnArr.joined(separator: "\n")
        }
        // 숫자 없이 -, 공백으로 이어진 경우 그대로 리턴
        return text
    }
}
