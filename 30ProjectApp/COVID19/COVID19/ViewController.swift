//
//  ViewController.swift
//  COVID19
//
//  Created by 우주형 on 2023/01/07.
//

import UIKit
import Charts
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    
    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var indicationView: UIActivityIndicatorView!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicationView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fetchCovidModel(completionHandler: { [weak self] result in
                guard let self = self else { return }
                self.indicationView.stopAnimating()
                self.indicationView.isHidden = true
                self.labelStackView.isHidden = false
                self.pieChartView.isHidden = false
                switch result {
                case let .success(result):
                    self.configureStackView(koreaCovidModel: result.korea)
                    let covidModelList = self.makeCovidModel(cityCovidModel: result)
                    self.configureChartView(covidModelList: covidModelList)
                    
                case let .failure(error):
                    print("error \(error)")
                }
            })
        }
        
    }
    
    func makeCovidModel(cityCovidModel: CityCovidModel) -> [CovidModel]  {
        return [
            cityCovidModel.seoul,
            cityCovidModel.busan,
            cityCovidModel.daegu,
            cityCovidModel.incheon,
            cityCovidModel.gwangju,
            cityCovidModel.daejeon,
            cityCovidModel.ulsan,
            cityCovidModel.sejong,
            cityCovidModel.gyeonggi,
            cityCovidModel.chungbuk,
            cityCovidModel.chungnam,
            cityCovidModel.gyeongbuk,
            cityCovidModel.gyeongnam,
            cityCovidModel.jeju
        ]
    }
    
    func configureChartView(covidModelList: [CovidModel]) {
        pieChartView.delegate = self
        let entries = covidModelList.compactMap { [weak self] covidModel -> PieChartDataEntry? in
            guard let self = self else { return nil }
            return PieChartDataEntry(value: removeFormatString(string: covidModel.newCase),
                                     label: covidModel.countryName,
                                     data: covidModel)
        }
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        dataSet.sliceSpace = 2
        dataSet.entryLabelColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1OffsetPercentage = 0.7
        dataSet.valueTextColor = .black
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        
        dataSet.colors = ChartColorTemplates.vordiplom() +
        ChartColorTemplates.joyful() +
        ChartColorTemplates.liberty() +
        ChartColorTemplates.pastel() +
        ChartColorTemplates.material()
        
        pieChartView.data = PieChartData(dataSet: dataSet)
        pieChartView.spin(duration: 0.3, fromAngle: pieChartView.rotationAngle, toAngle: pieChartView.rotationAngle + 30)
    }
    
    func removeFormatString(string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    func configureStackView(koreaCovidModel: CovidModel) {
        totalCaseLabel.text = "\(koreaCovidModel.totalCase)명"
        newCaseLabel.text = "\(koreaCovidModel.newCase)명"
    }
    
    func fetchCovidModel(completionHandler: @escaping (Result<CityCovidModel, Error>) -> Void) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = ["serviceKey": "i7VI9hp3TGLeW16POklQwC5HSYcJZ8dUj"]
        
        AF.request(url, method: .get, parameters: param)
            .responseData { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidModel.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            }
    }
    
}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let covidDetailVC = storyboard?.instantiateViewController(withIdentifier: "CovidDetailViewController") as? CovidDetailViewController else { return }
        guard let covidModel = entry.data as? CovidModel else { return }
        covidDetailVC.covidModel = covidModel
        navigationController?.pushViewController(covidDetailVC, animated: true)
    }
}
