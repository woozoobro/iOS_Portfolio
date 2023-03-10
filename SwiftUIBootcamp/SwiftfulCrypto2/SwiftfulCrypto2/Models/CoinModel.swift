//
//  CoinModel.swift
//  SwiftfulCrypto2
//
//  Created by 우주형 on 2023/03/05.
//

import Foundation

/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 JSON Response:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 22445,
     "market_cap": 433164464213,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 471107410160,
     "total_volume": 16128032557,
     "high_24h": 22671,
     "low_24h": 22158,
     "price_change_24h": 89.13,
     "price_change_percentage_24h": 0.3987,
     "market_cap_change_24h": 1489458837,
     "market_cap_change_percentage_24h": 0.34504,
     "circulating_supply": 19308662,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -67.4732,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 33019.57564,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2023-03-05T05:12:18.667Z",
     "sparkline_in_7d": {
       "price": [
         23109.274124527044,
         23111.965294345282,
         23203.12054145884,
         23226.771708108896,
         23199.451796566933,
         23156.586624915755,
         23148.554170370713,
         23149.258310453366,
         23178.680897720413,
         23209.74278507961,
         23232.819035504683,
         23271.622484390497,
         23196.864278608176,
         23194.37589677075,
         23199.25018317414,
         23223.531035052576,
         23189.27520664493,
         23220.62966476974,
         23344.186184218557,
         23482.315853852826,
         23669.06354041027,
         23562.039137369797,
         23443.161512694092,
         23541.115854493557,
         23481.850410097755,
         23526.52711415966,
         23566.349850354734,
         23557.48236591532,
         23513.113868169472,
         23383.304204537424,
         23401.021843042025,
         23434.3807552459,
         23353.66834311892,
         23399.962971043096,
         23414.677893728323,
         23425.05821219766,
         23386.5737430716,
         23687.886337410826,
         23757.151327369662,
         23751.800585392026,
         23438.38764054244,
         23361.078020029447,
         23266.300081567184,
         23296.864189501834,
         23225.092570474746,
         23383.213780034173,
         23498.790807539142,
         23518.12390627588,
         23447.372547411458,
         23428.27476629141,
         23442.59617191545,
         23483.788027742157,
         23419.12200685739,
         23398.968362613083,
         23408.22913204305,
         23217.499188246024,
         23275.03579409593,
         23285.191273323242,
         23338.788002742633,
         23399.565103862453,
         23464.879850824655,
         23393.918570120426,
         23414.49112642032,
         23525.715578857256,
         23455.08412921352,
         23508.577775294714,
         23470.418161200392,
         23290.5856616495,
         23298.72210171402,
         23063.29381745662,
         23159.646636797075,
         23155.543746825795,
         23079.25455948012,
         23292.304851388086,
         23308.9018750499,
         23482.184295045467,
         23784.042799879942,
         23691.414512124713,
         23777.49665207094,
         23709.915797916765,
         23829.946743900706,
         23778.152542468997,
         23799.188758891083,
         23728.16064979413,
         23735.748910827864,
         23696.081721592756,
         23796.06510462297,
         23726.2506975257,
         23665.59155956524,
         23712.71782096267,
         23682.52545294416,
         23556.225693504046,
         23427.883714031843,
         23576.425430335858,
         23504.747683174395,
         23634.333489123786,
         23663.12537721522,
         23519.00841198621,
         23493.811912342382,
         23506.48966274534,
         23428.364922512046,
         23438.2953781779,
         23455.193198202353,
         23393.49886298945,
         23449.933923364155,
         23429.430046442114,
         23412.569662781654,
         23423.026552982563,
         23349.073024716425,
         23335.594101318686,
         23302.64712467313,
         23330.35049835348,
         23283.76528293185,
         23279.37122891428,
         23397.205230397754,
         23473.5347574165,
         23539.61281971209,
         23447.605445168498,
         23515.128732237215,
         23469.231618829668,
         23435.63929517383,
         22259.675591254836,
         22379.1459397478,
         22370.707926324667,
         22391.647510563194,
         22370.28747392772,
         22384.984819417034,
         22383.126357783643,
         22405.532208305485,
         22396.803791664923,
         22381.840673031795,
         22375.545543065367,
         22353.188705437304,
         22431.416229651353,
         22396.218654305092,
         22357.601228312662,
         22362.95667643471,
         22417.00489088355,
         22340.64433137837,
         22366.54355005848,
         22332.474297937708,
         22307.671979178518,
         22314.52765702006,
         22362.45766625331,
         22395.932301491983,
         22370.469224641507,
         22373.094466822888,
         22374.181314932543,
         22364.052855247235,
         22349.33800459337,
         22388.415821286224,
         22383.081540900494,
         22359.834190689075,
         22374.13749070038,
         22352.073543907267,
         22352.717672379025,
         22380.236620205513,
         22378.75135601226,
         22363.70699450674,
         22335.296596622255,
         22339.448877842322,
         22311.580191799014,
         22333.93450398392,
         22233.9306002736,
         22203.57313487645,
         22215.732009315154,
         22346.33233920694,
         22348.32991538815
       ]
     },
     "price_change_percentage_24h_in_currency": 0.3986992521246092
   }
 
 */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}
