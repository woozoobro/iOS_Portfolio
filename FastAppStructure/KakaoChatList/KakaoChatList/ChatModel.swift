//
//  ChatModel.swift
//  KakaoChatList
//
//  Created by 우주형 on 2022/12/25.
//

import Foundation

struct ChatModel {
    let name: String
    let chatting: String
    let date: String
    let icon: String
}

extension ChatModel {
    static let list: [ChatModel] = [
        ChatModel(name: "로켓펀치", chatting: "우주형님 안녕하세요 로켓펀치 봇입니다.", date: "2022-12-25", icon: "icon0"),
        ChatModel(name: "메일 알리미", chatting: "새메일이 도착했어요", date: "2022-12-24", icon: "icon1"),
        ChatModel(name: "우주형", chatting: "동영상을 보냈습니다", date: "2022-12-23", icon: "icon2"),
        ChatModel(name: "카카오이모티콘", chatting: "(광고) 🎄크리스마스에는 읏추추 춘식이!", date: "2022-12-22", icon: "icon3"),
        ChatModel(name: "토스뱅크", chatting: "우*형님 통장에서 이자 10,000원 입금되었습니다", date: "2022-12-21", icon: "icon4"),
        ChatModel(name: "그리팅", chatting: "카카오로부터 wwoods@kakao.com 주소로 메일이 도착했습니다.", date: "2022-12-23" , icon: "icon5"),
        ChatModel(name: "단톡", chatting: "어디가노", date: "2022-12-15", icon: "icon6"),
        ChatModel(name: "안녕", chatting: "동영상을 보냈습니다", date: "2022-12-13", icon: "icon3"),
        ChatModel(name: "한", chatting: "사진을 보냈습니다.", date: "2022-12-13", icon: "icon0"),
        ChatModel(name: "아잉", chatting: "오야오야", date: "2022-12-08", icon: "icon4"),
        ChatModel(name: "애플", chatting: "토스페이먼츠 개인정보 이용내역 안내", date: "2022-12-03", icon: "icon2"),
        ChatModel(name: "채용", chatting: "소중한 마음이 잊히지 않도록 선물하기에서 알려드려요", date: "2022-12-02", icon: "icon5"),
    ]
}
