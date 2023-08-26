//
//  ChatBotMainView.swift
//  Yakssok
//
//  Created by 정승균 on 2023/08/26.
//

import SwiftUI

struct ChatBotMainView: View {
    @Binding var showModal: Bool
    @State var textVal: String = ""
    @State var messages: [String] = ["안녕하세요, 약쏙입니다. 약과 관련된 질문을 해주세요!!"]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ScrollView {
                    ForEach(messages, id: \.self) { message in
                        if message.contains("[USER]") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            
                            HStack {
                                Spacer()
                                
                                Text(newMessage)
                                    .padding(EdgeInsets(top: 9, leading: 12, bottom: 9, trailing: 12))
                                    .foregroundColor(.theme.gray.black)
                                    .background(Color.theme.primary.main20)
                                    .cornerRadius(16)
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 9))
                            
                        } else {
                            HStack(alignment: .top,spacing: 11) {
                                Image("InChatCharacter")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .padding(.leading, 18)
                                Text(message)
                                    .padding(EdgeInsets(top: 9, leading: 12, bottom: 9, trailing: 12))
                                    .foregroundColor(.theme.gray.black)
                                    .background(Color.theme.gray.gray5)
                                    .cornerRadius(8)
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 9))
                        }
                    }
                    .rotationEffect(.degrees(180))
                }
                .rotationEffect(.degrees(180))
                
                Spacer(minLength: 70)
                
                
            }

            
            VStack {
                Spacer()
                
                ZStack {
                    TextField("궁금한 것을 물어보세요!", text: $textVal)
                        .padding(.horizontal, 24)
                        .padding(.vertical)
                        .background(Color.theme.gray.gray6)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            sendMessage(message: textVal)
                        }
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            sendMessage(message: textVal)
                        } label: {
                            Image(systemName: textVal == "" ? "" : "arrow.up.circle.fill")
                                .font(.title3)
                                .foregroundColor(.theme.primary.main40)
                                .padding(.trailing, 36)
                        }
                        
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    showModal = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.theme.gray.black)
                }
            }
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
          if message != "" {
            messages.append("[USER]" + message)
            self.textVal = ""
          }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          withAnimation {
            if message != "" {
              messages.append(getBotResponse(message: message))
            }
          }
        }
      }
}

struct ChatBotMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatBotMainView(showModal: .constant(false))
        }
    }
}

func getBotResponse(message: String) -> String {
  let tempMessage = message.lowercased()
  
  if tempMessage.contains("커피") {
    return "약물과 커피 복용 전에 의사나 약사와 상담하세요."
  } else if tempMessage.contains("빈속") {
    return "약 복용 전에 의사나 약사와 빈속 여부에 따라 안전 여부를 확인하세요. 일부 약은 식사와 함께 복용해야 할 수도 있습니다."
  } else if tempMessage.contains("함께") {
    return "현재 가진 약 중 노르믹스정(빨강)과 레바트정(흰색)은 함께 복약하는데에 주의해주세요."
  } else if tempMessage.contains("리콜") {
    return "라벨라정(노랑)은 현재 리콜 대상입니다. 의사나 약사와 상담을 통해 처리해주세요."
  } else {
    return "좋은 하루 보내ㅎㅎ"
  }
}
