//
//  MedicineDetailView.swift
//  Yakssok
//
//  Created by 박상원 on 2023/08/25.
//

import SwiftSoup
import SwiftUI

struct MedicineDetailModalView: View {
    @StateObject var medication: Medication = .init()
    @Binding var isShow: Bool
    var medName: String

    var body: some View {
        ZStack {
            ScrollView {
                HStack(alignment: .bottom, spacing: 8) {
                    Text(medication.medicationDetail["의약품 이름"] ?? "")
                        .font(.pretendard(size: 26, .bold))
                    Text("유사도 98%")
                        .font(.subheadlineSemiBold)
                        .foregroundColor(Color.theme.medicine.first)
                    Spacer()
                }
                .padding(.bottom, 30)
                AsyncImage(url: URL(string: medication.medicationDetail["medImage"] ?? "")) { phase in
                    switch phase {
                    case .empty:
                        Text("Loading...")
                    case let .success(image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Text("Failed to load image")
                            .foregroundColor(.red)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.bottom, 19)

                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("식약처 분류")
                                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                .foregroundColor(Color.theme.gray.gray2)
                            Text(medication.medicationDetail["식약처 분류"] ?? "")
                                .foregroundColor(Color.theme.gray.black)
                            Spacer()
                        }
                        HStack {
                            Text("구분")
                                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                .foregroundColor(Color.theme.gray.gray2)
                            Text(medication.medicationDetail["구분"] ?? "")
                                .foregroundColor(Color.theme.gray.black)
                        }
                        HStack {
                            Text("제조(수입) 업체명")
                                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                .foregroundColor(Color.theme.gray.gray2)
                            Text(medication.medicationDetail["제조(수입) 업체명"] ?? "")
                                .foregroundColor(Color.theme.gray.black)
                        }
                        HStack {
                            Text("제조·수입 구분")
                                .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                .foregroundColor(Color.theme.gray.gray2)
                            Text(medication.medicationDetail["제조·수입 구분"] ?? "")
                                .foregroundColor(Color.theme.gray.black)
                        }
                    }
                    .font(.caption1)
                    .padding(.bottom, 40)
                    Text("효능효과")
                        .font(.headlineSemiBold)
                        .padding(.bottom, 4)
                    Text(medication.medicationDetail["효능효과"] ?? "")
                        .font(.body2)
                        .lineSpacing(5.0)
                    Divider().foregroundColor(Color.theme.gray.gray6)
                        .padding(.vertical, 12)
                    Text("용법용량")
                        .font(.headlineSemiBold)
                        .padding(.bottom, 4)
                    Text(medication.medicationDetail["용법용량"] ?? "")
                        .font(.body2)
                        .lineSpacing(5.0)
                    Divider().foregroundColor(Color.theme.gray.gray6)
                        .padding(.vertical, 12)
                    NavigationLink {
                        ScrollView {
                            Text(medication.medicationDetail["사용상 주의사항"] ?? "")
                                .padding(.horizontal, 24)
                                .lineSpacing(5.0)
                                .padding(.top, 40)
                        }
                        .navigationTitle(Text("사용상 주의사항"))
                    } label: {
                        HStack {
                            Text("사용상 주의사항")
                                .foregroundColor(Color.theme.gray.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.theme.gray.gray1)
                        }
                    }

                    Rectangle().fill(.white)
                        .frame(height: 50)
                }
                .onAppear {
                    medication.medName = medName
                    print(medName)
                    medication.fetchSearchResults()
                }
                .navigationTitle(Text(""))
            }
            .frame(height: UIScreen.main.bounds.height * 0.8)
            .scrollIndicators(.hidden)
            .padding(.horizontal, 24)
            Button {
                isShow = false
            } label: {
                Text("선택하기")
                    .padding(.vertical, 18.5)
                    .font(.pretendard(size: 16, .bold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.theme.primary.main40)
            .cornerRadius(12)
            .padding(.horizontal, 24)
            .shadow(color: .white, radius: 20)
            .offset(y: 350)
        }
    }
}
//
//struct MedicineDetailModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicineDetailModalView(medName: "메티마졸")
//            .environmentObject(Medication())
//    }
//}
