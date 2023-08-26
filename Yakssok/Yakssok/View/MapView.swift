//
//  MapView.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/25.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: View {
    @State private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.52535,
            longitude: 129.48409),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    )
    @State private var currentLocation = CLLocationCoordinate2D()
    @State private var userTrackingMode: MapUserTrackingMode = .none
    @State private var places: [Place] = []
    @State private var selectedPlace: Place? = nil
    @State private var isCenterOn = false
    @State private var isClinicOn = false
    @State private var isPharmOn = false
    @State private var directions: [String] = []
    @State private var showDirections = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if !showDirections {
                    Map(coordinateRegion: $region,
                        interactionModes: MapInteractionModes.all,
                        showsUserLocation: true,
                        userTrackingMode: $userTrackingMode,
                        annotationItems: filterPlaces(isCenterOn, isClinicOn, isPharmOn, places)) { item in
                        MapAnnotation(coordinate: item.coordinate) {
                            drawMarker(item.symbol, item.color)
                                .onTapGesture {
                                    selectedPlace = item
                                }
                        }
                    }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(ColorTheme().gray.black)
                                }
                            }
                        }
                    
                    //TODO: 디자인 수정
                    VStack(spacing: 0) {
                        Button {
                            self.isCenterOn.toggle()
                        } label: {
                            VStack {
                                Image(systemName: isCenterOn ? "building.fill" : "building")
                                    .foregroundColor(isCenterOn ? ColorTheme().medicine.first : ColorTheme().gray.gray1)
                                Text("주민센터")
                                    .font(.caption2SemiBold)
                                    .foregroundColor(ColorTheme().gray.gray1)
                            }
                            .frame(width: 44, height: 44)
                        }
                        .background(.regularMaterial)
                        .background(isCenterOn ?  ColorTheme().medicine.first20 : ColorTheme().gray.white.opacity(0.8))
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                        
                        Divider()
                            .frame(width: 44)
                        
                        Button {
                            self.isClinicOn.toggle()
                        } label: {
                            VStack {
                                Image(systemName: isClinicOn ? "cross.fill" : "cross")
                                    .foregroundColor(isClinicOn ? ColorTheme().medicine.second : ColorTheme().gray.gray1)
                                Text("보건소")
                                    .font(.caption2SemiBold)
                                    .foregroundColor(ColorTheme().gray.gray1)
                            }
                            .frame(width: 44, height: 44)
                        }
                        .background(.regularMaterial)
                        .background(isClinicOn ? ColorTheme().medicine.second20 :
                                        ColorTheme().gray.white.opacity(0.8))
                        
                        Divider()
                            .frame(width: 44)
                        
                        Button {
                            self.isPharmOn.toggle()
                        } label: {
                            VStack {
                                Image(systemName: isPharmOn ? "pill.fill" : "pill")
                                    .foregroundColor(isPharmOn ? ColorTheme().medicine.third : ColorTheme().gray.gray1)
                                Text("약국")
                                    .font(.caption2SemiBold)
                                    .foregroundColor(ColorTheme().gray.gray1)
                            }
                            .frame(width: 44, height: 44)
                        }
                        .background(.regularMaterial)
                        .background(isPharmOn ? ColorTheme().medicine.third20 : ColorTheme().gray.white.opacity(0.8))
                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])

                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                } else {
                    PathOverlayView(home: $currentLocation, destination: $selectedPlace, directions: $directions)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    showDirections.toggle()
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(ColorTheme().gray.black)
                                }
                            }
                        }
                }
                VStack(alignment: .trailing) {
                    Button {
                        userTrackingMode = .follow
                        if let location = locationManager.lastLocation {
                            currentLocation = location.coordinate
                        }
                    } label: {
                        Image(systemName: "location")
                            .foregroundColor(ColorTheme().gray.gray2)
                            .padding(12)
                            .background(
                                ColorTheme().gray.white
                            )
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.trailing, 20)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .onAppear {
            loadPlacesFromCSV()
            if let location = locationManager.lastLocation {
                region.center = location.coordinate
                region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                currentLocation = location.coordinate
            }
        }
        .sheet(item: $selectedPlace) { item in
            InfoView(home: $currentLocation, item: .constant(item), showDirections: $showDirections)
                .presentationDetents([.height(333)])
                .presentationDragIndicator(.visible)
        }
    }
    
    func loadPlacesFromCSV() {
        if let filepath = Bundle.main.path(forResource: "UlsanPlaceInfo", ofType: "csv") {
            do {
                let fileContent = try String(contentsOfFile: filepath)
                let lines = fileContent.components(separatedBy: "\n")
                lines.dropFirst().forEach { line in
                    let data = line.components(separatedBy: ",")
                    if data.count > 3 {
                        let name = data[0]
                        let latitudeStr = data[1]
                        let longitudeStr = data[2]
                        let address = data[3].replacingOccurrences(of: "@", with: ",")
                        let phone = data[4]
                        let category = data[5]
                        if let latitude = Double(latitudeStr), let longitude = Double(longitudeStr) {
                            let place = Place(name: name, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), address: address, phone: phone, category: category)
                            places.append(place)
                        }
                    }
                }
            } catch {
                print("Error: \(error)")
            }
        } else {
            print("File could not be found.")
        }
    }
    
    func drawMarker(_ symbol: String, _ color: Color) -> some View {
        let markerImage = Image(systemName: symbol)
            .padding(4)
            .foregroundColor(ColorTheme().gray.white)
            .background(
                Circle()
                    .foregroundColor(color)
                    .frame(width: 32, height: 32)
            )
        return markerImage
    }
    
    func filterPlaces(_ isCenterOn: Bool, _ isClinicOn: Bool, _ isPharmOn: Bool, _ places: [Place]) -> [Place] {
        let filteredPlaces = places.filter { place in
            if isCenterOn && place.category == "행정복지센터" {
                return true
            }
            if isClinicOn && place.category == "보건소" {
                return true
            }
            if isPharmOn && place.category == "약국" {
                return true
            }
            return false
        }
        return filteredPlaces
    }
}

struct Place: Identifiable {
    let id = UUID()
    var name: String
    let coordinate: CLLocationCoordinate2D
    let address: String
    let phone: String
    let category: String
    
    var symbol: String {
        switch category {
        case "행정복지센터":
            return "building.fill"
        case "보건소":
            return "cross.fill"
        case "약국":
            return "pill.fill"
        default:
            return "questionmark"
        }
    }
    
    var color: Color {
        switch category {
        case "행정복지센터":
            return ColorTheme().medicine.first
        case "보건소":
            return ColorTheme().medicine.second
        case "약국":
            return ColorTheme().medicine.third
        default:
            return ColorTheme().medicine.fourth
        }
    }
}

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var home: CLLocationCoordinate2D
    @Binding var item: Place
    @Binding var showDirections: Bool
    
    @State var showReportView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 8) {
                Text("\(item.name)")
                    .font(.title2Bold)
                
                Text("\(item.category)")
                    .font(.caption1)
            }
            .padding(.top, 40)
            .padding(.bottom, 8)
            .padding(.horizontal, 20)
            
            HStack(spacing: 8) {
                Text("\(home.distance(from: item.coordinate))")
                    .font(.body1SemiBold)
                
                Text("\(item.address)")
                    .font(.body2)
            }
            .padding(.bottom, 32)
            .padding(.horizontal, 20)
            
            HStack(spacing: 15) {
                Button{
                    self.showDirections.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "location.fill")
                        Text("길 안내")
                    }
                    .padding(.horizontal, 45.5)
                    .padding(.vertical, 16.5)
                    .font(.body1SemiBold)
                    .foregroundColor(ColorTheme().gray.white)
                    .background(
                        ColorTheme().primary.main40
                    )
                    .cornerRadius(8)
                }
                
                Button{
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "phone.fill")
                        Text("통화")
                    }
                    .padding(.horizontal, 54.5)
                    .padding(.vertical, 16.5)
                    .font(.body1SemiBold)
                    .foregroundColor(ColorTheme().primary.main40)
                    .background(
                        ColorTheme().primary.main10
                    )
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal, 20)
            
            Rectangle()
                .frame(height: 12)
                .frame(maxWidth: .infinity)
                .foregroundColor(ColorTheme().gray.gray6)
                .padding(.vertical, 28)
            
            Button{
                self.showReportView.toggle()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "exclamationmark.bubble.fill")
                    Text("해당 수거함에 문제가 발생했나요?")
                }
                .padding(.vertical, 9)
                .padding(.leading, 16)
                .foregroundColor(ColorTheme().primary.main40)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(ColorTheme().primary.main40)
                )
            }
            .padding(.horizontal, 20)
        }
        .padding(.bottom, 60)
        .fullScreenCover(isPresented: $showReportView) {
            ReportView(name: $item.name, showReportView: $showReportView)
        }
    }
}

struct ReportView: View {
    @Binding var name: String
    @Binding var showReportView: Bool
    @State var showReportDoneView = false
    @State var problems: [String] = []
    
    let reportContents = ["이름이 잘못됨", "지도상 주소 또는 위치가 잘못됨", "전화번호가 잘못됨", "운영 중이 아님", "기타 사항 또는 복수의 항목이 잘못됨"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(name)의\n어떤 문제를 신고할까요?")
                    .font(.title3SemiBold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                //TODO: 디자인 수정
                List {
                    ForEach(reportContents, id: \.self) { content in
                        Text(content)
                    }
                    .onTapGesture {
                        //TODO: 다중 선택
                        
                    }
                }
            }
            .fullScreenCover(isPresented: $showReportDoneView) {
                ReportDoneView(name: $name, showReportDoneView: $showReportDoneView)
            }
            //TODO: toolbar 사이즈 조정
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showReportView = false
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(ColorTheme().gray.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                        Text("문제 신고")
                            .font(.headlineSemiBold)
                            .foregroundColor(ColorTheme().gray.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showReportDoneView = true
                        showReportView = false
                    } label: {
                        Text("보내기")
                            .foregroundColor(problems.count == 0 ? ColorTheme().gray.gray4 : ColorTheme().gray.black)
                    }
//                    .disabled(problems.count == 0)
                }
            }
        }
    }
}

struct ReportDoneView: View {
    @Binding var name: String
    @Binding var showReportDoneView: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(name)의\n문제 신고를 완료했습니다.")
                    .font(.title3SemiBold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 52)
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 148)
                    .foregroundColor(ColorTheme().primary.main40)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showReportDoneView = true
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(ColorTheme().gray.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("문제 신고")
                        .font(.headlineSemiBold)
                        .foregroundColor(ColorTheme().gray.black)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showReportDoneView = false
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDoneView(name: .constant("약국"), showReportDoneView: .constant(true))
    }
}


