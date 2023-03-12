//
//  CoinModel.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/12.
//

import Foundation

/*
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 Response:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 20426,
     "market_cap": 394401425546,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 428809708741,
     "total_volume": 35039812715,
     "high_24h": 20681,
     "low_24h": 19950.03,
     "price_change_24h": -161.8925820616023,
     "price_change_percentage_24h": -0.78634,
     "market_cap_change_24h": -3638323313.89093,
     "market_cap_change_percentage_24h": -0.91406,
     "circulating_supply": 19314931,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -70.42475,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 30014.23836,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2023-03-12T02:04:01.670Z",
     "sparkline_in_7d": {
       "price": [
         22348.32991538815,
         22365.67919223727,
         22609.50968265507,
         22271.621307056605,
         22412.691294442255,
         22458.18155355079,
         22446.9013154151,
         22436.738723314254,
         22397.556696941287,
         22337.749516730626,
         22386.65369422633,
         22432.317957103267,
         22412.868368255655,
         22451.735137132684,
         22493.63280866233,
         22465.464231100654,
         22476.240200045482,
         22441.430518504727,
         22459.730831121095,
         22429.0166710947,
         22427.021335757956,
         22429.168230685544,
         22534.14106727921,
         22455.521105156393,
         22432.85634630719,
         22446.704207355437,
         22405.871753227584,
         22420.56459795589,
         22407.277637305626,
         22362.00823955405,
         22375.039455087837,
         22422.125634818287,
         22413.812768997555,
         22431.198532520255,
         22407.24052716349,
         22404.298903649327,
         22400.563638335858,
         22393.18714275068,
         22405.74091399527,
         22460.953361220167,
         22432.71924932509,
         22548.56002224413,
         22529.992641588986,
         22495.502238217545,
         22536.241866918812,
         22456.20719527491,
         22362.196507265864,
         22413.870229736516,
         22430.81746309442,
         22414.06021826144,
         22492.302674204086,
         22463.93220672041,
         22515.21563268249,
         22480.78676386218,
         22473.944938112774,
         22471.823436897506,
         22445.71820108979,
         22441.55103007756,
         22421.621426118632,
         22400.010449736306,
         22409.451022887457,
         22383.223220601696,
         22406.735643216747,
         22401.431348025064,
         22353.43403616607,
         22331.018759965096,
         22245.6038174552,
         22327.793618615127,
         22228.55405539254,
         22203.698566363462,
         22051.451967084125,
         22078.895826128584,
         22099.854839403637,
         22217.209884905325,
         22292.230162666576,
         22160.33206266994,
         22186.36968798273,
         22165.58296915028,
         22142.02810099169,
         21953.980294081073,
         22004.02129174228,
         22033.525072926594,
         21996.975848304148,
         22033.292611374643,
         22119.05660147016,
         22089.111218236074,
         22023.792601069603,
         21988.427704428243,
         21996.437775273775,
         22145.99908374674,
         22153.288348301492,
         22084.73871643898,
         22045.176240628607,
         22027.347434954176,
         22106.28168957777,
         22036.708973982408,
         21964.16070779069,
         21716.15632278766,
         21720.374529975055,
         21731.002438356238,
         21780.264719268274,
         21769.444086926935,
         21749.76424408577,
         21748.11793939083,
         21731.60023509299,
         21708.925914286992,
         21702.085416293376,
         21645.629172649456,
         21669.908087750096,
         21680.72422885794,
         21640.36177784387,
         21742.881357434017,
         21766.100920425797,
         21657.259968088314,
         21467.29006662448,
         21476.6211959799,
         21062.06888147991,
         20915.60748157303,
         20207.416674217828,
         20256.237264428655,
         20381.708088738338,
         20368.318163263935,
         20106.49927115662,
         20121.722912996465,
         20055.9629740996,
         20098.69680757734,
         19923.68807279441,
         20014.593981052483,
         19927.84901663721,
         19952.053930132868,
         19966.099406627905,
         19927.031640527064,
         19662.44149159682,
         19736.70214276614,
         20015.141795842756,
         20140.716096819775,
         19726.498317449248,
         20017.56126117087,
         20015.74975034846,
         19998.38051357231,
         19873.05651922205,
         20014.94794417126,
         19978.40357393128,
         20112.688589332083,
         20125.326859603574,
         20161.423237145915,
         20289.122305747762,
         20641.53384712589,
         20496.439504448153,
         20430.281920284022,
         20354.92119559217,
         20422.183524835124,
         20320.149386386733,
         19997.68589321568,
         20144.278466016294,
         20153.915419082572,
         20070.351740652604,
         20060.5039879907,
         20065.064620294488,
         20148.628585917606,
         20147.449083421205,
         20109.695014321405,
         20099.601274125893,
         20213.861350166047,
         20420.11198972381,
         20260.380642135693,
         20404.807576276766,
         20412.131059720636,
         20377.60331694696
       ]
     },
     "price_change_percentage_24h_in_currency": -0.7863383248323823
   }
 
 */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name, image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H: Double?
    let low24H, priceChange24H, priceChangePercentage24H, marketCapChange24H: Double?
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

struct SparklineIn7D: Codable {
    let price: [Double]?
}
