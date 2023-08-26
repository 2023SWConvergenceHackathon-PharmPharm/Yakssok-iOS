////
////  TestView.swift
////  Yakssok
////
////  Created by 박상원 on 2023/08/27.
////
//
//import SwiftUI
//
//struct TestView: View {
//    @State var isShow: Bool = false
//    var body: some View {
//        Button {
//            isShow = true
//        } label: {
//            Text("GO")
//        }
//        .sheet(isPresented: $isShow) {
//            MedicineDetailModalView(isShow: $isShow, medName: "라벨라")
//        }
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
