//
//  MarketDataModel.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/12.
//

import Foundation

/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 11525,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 681,
     "total_market_cap": {
       "btc": 47887673.57784813,
       "eth": 667851923.503375,
       "ltc": 14336675596.32292,
       "bch": 8643480630.260477,
       "bnb": 3547170842.712959,
       "eos": 999426086819.4138,
       "xrp": 2721964470598.335,
       "xlm": 12283391080382.87,
       "link": 159771979668.6201,
       "dot": 179530531093.24298,
       "yfi": 135760345.2609086,
       "usd": 977693371799.4734,
       "aed": 3590774446607.9307,
       "ars": 194928530145822.88,
       "aud": 1485178804139.1997,
       "bdt": 102560649670895.69,
       "bhd": 368695992052.5564,
       "bmd": 977693371799.4734,
       "brl": 5100821859352.221,
       "cad": 1355034128645.484,
       "chf": 899536563657.8229,
       "clp": 775218099843734.6,
       "cny": 6752145964321.557,
       "czk": 21713787632968.875,
       "dkk": 6839062905074.524,
       "eur": 918323919490.3217,
       "gbp": 812442660404.5577,
       "hkd": 7674746314620.088,
       "huf": 352003833115824,
       "idr": 15156740380989944,
       "ils": 3497150529324.413,
       "inr": 80137126066229.77,
       "jpy": 131983659286584.64,
       "krw": 1291180974533258,
       "kwd": 300185106717.08,
       "lkr": 316216982390554.5,
       "mmk": 2043127004828780,
       "mxn": 18080874602036.4,
       "myr": 4418685193847.728,
       "ngn": 448076807767936.6,
       "nok": 10346474326335.957,
       "nzd": 1594932706670.6616,
       "php": 53949115367428.22,
       "pkr": 273068808425635.75,
       "pln": 4299064409808.0615,
       "rub": 74519311684190.34,
       "sar": 3671170172571.0044,
       "sek": 10469512148710.057,
       "sgd": 1318810589220.3093,
       "thb": 34034367620200.254,
       "try": 18534621118195.176,
       "twd": 30155681051771.453,
       "uah": 35909088794465.52,
       "vef": 97896437318.28154,
       "vnd": 23146890577352588,
       "zar": 17912906880761.254,
       "xdr": 731513113860.4818,
       "xag": 47616893594.761375,
       "xau": 523584131.39977384,
       "bits": 47887673577848.13,
       "sats": 4788767357784813
     },
     "total_volume": {
       "btc": 2994713.433081624,
       "eth": 41764925.65197675,
       "ltc": 896561302.4455267,
       "bch": 540530487.6617694,
       "bnb": 221826607.52644783,
       "eos": 62500315925.86697,
       "xrp": 170221331617.2132,
       "xlm": 768156678407.3989,
       "link": 9991533478.147326,
       "dot": 11227158325.810078,
       "yfi": 8489936.955732804,
       "usd": 61141234376.379105,
       "aed": 224553411494.12787,
       "ars": 12190090770844.742,
       "aud": 92877448056.72023,
       "bdt": 6413753943918.596,
       "bhd": 23056848613.20761,
       "bmd": 61141234376.379105,
       "brl": 318986047988.4456,
       "cad": 84738693783.94287,
       "chf": 56253604100.33133,
       "clp": 48479199002975.766,
       "cny": 422253592850.1515,
       "czk": 1357897902511.8796,
       "dkk": 427689048586.2113,
       "eur": 57428494060.107834,
       "gbp": 50807081800.849335,
       "hkd": 479949518669.41907,
       "huf": 22012984318699.69,
       "idr": 947845042981537,
       "ils": 218698526890.2458,
       "inr": 5011471846277.1045,
       "jpy": 8253757342591.799,
       "krw": 80745559766821.4,
       "kwd": 18772437755.517216,
       "lkr": 19775010439671.523,
       "mmk": 127769411827992.9,
       "mxn": 1130709303816.1304,
       "myr": 276327808764.0459,
       "ngn": 28021023679373.11,
       "nok": 647029252731.2361,
       "nzd": 99741040745.3436,
       "php": 3373773007182.436,
       "pkr": 17076687332042.885,
       "pln": 268847178738.09586,
       "rub": 4660155047245.235,
       "sar": 229581055196.8977,
       "sek": 654723571371.3312,
       "sgd": 82473411050.29776,
       "thb": 2128380234069.2444,
       "try": 1159084889548.9746,
       "twd": 1885821890734.7266,
       "uah": 2245618184138.5454,
       "vef": 6122071798.106856,
       "vnd": 1447518723860778.8,
       "zar": 1120205239750.269,
       "xdr": 45746054984.11001,
       "xag": 2977779880.2031097,
       "xau": 32742965.245582424,
       "bits": 2994713433081.624,
       "sats": 299471343308162.44
     },
     "market_cap_percentage": {
       "btc": 40.33481803746448,
       "eth": 18.012831278911516,
       "usdt": 7.385361775506148,
       "bnb": 4.451166514112013,
       "usdc": 3.968378895999822,
       "xrp": 1.8713241737336306,
       "ada": 1.0992125493356932,
       "matic": 0.9892980869730875,
       "doge": 0.9356301046696353,
       "steth": 0.8604926499949695
     },
     "market_cap_change_percentage_24h_usd": 1.8365246417109298,
     "updated_at": 1678627092
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
}
