//
//  CalendarViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/12.
//

import UIKit

class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendarView = UICalendarView(frame: UIScreen.main.bounds)
        let greCalendar = Calendar(identifier: .gregorian)
        let selection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = selection
        calendarView.calendar = greCalendar
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.tintColor = .systemMint
        calendarView.fontDesign = .monospaced
        calendarView.delegate = self
        self.view.addSubview(calendarView)
    }
}

extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        true
    }
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let timeListVC = sb.instantiateViewController(withIdentifier: "TimeListViewController") as! TimeListViewController
        navigationController?.pushViewController(timeListVC, animated: true)
    }
}

extension CalendarViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        guard let day = dateComponents.day else {
            return nil
        }
        if !day.isMultiple(of: 2) {
//            return UICalendarView.Decoration.image(UIImage(systemName: "gear"), color: .systemMint, size: .large)
            return UICalendarView.Decoration.default(color: .systemMint, size: .large)
        }
        return nil
    }
}
