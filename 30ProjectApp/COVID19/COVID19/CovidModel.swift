//
//  CovidModel.swift
//  COVID19
//
//  Created by 우주형 on 2023/01/07.
//

import Foundation

struct CovidModel: Codable {
    let countryName: String
    let newCase: String
    let totalCase: String
    let recovered: String
    let death: String
    let percentage: String
    let newCcase: String
    let newFcase: String
}

struct CityCovidModel: Codable {
    let korea: CovidModel
    let seoul: CovidModel
    let busan: CovidModel
    let daegu: CovidModel
    let incheon: CovidModel
    let gwangju: CovidModel
    let daejeon: CovidModel
    let ulsan: CovidModel
    let sejong: CovidModel
    let gyeonggi: CovidModel
    let gangwon: CovidModel
    let chungbuk: CovidModel
    let chungnam: CovidModel
    let jeonbuk: CovidModel
    let jeonnam: CovidModel
    let gyeongbuk: CovidModel
    let gyeongnam: CovidModel
    let jeju: CovidModel
}
