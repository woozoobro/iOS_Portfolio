//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by 우주형 on 2023/01/06.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
}

class WriteDiaryViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    weak var delegate: WriteDiaryViewDelegate?
    var diaryEditorMode: DiaryEditorMode = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContentsTextView()
        configureDatePicker()
        configureInputField()
        configureEditMode()
        confirmButton.isEnabled = false
    }
    
    private func configureEditMode() {
        switch diaryEditorMode {
        case let .edit(_, diary):
            titleTextField.text = diary.title
            contentsTextView.text = diary.contents
            dateTextField.text = dateToString(date: diary.date)
            diaryDate = diary.date
            confirmButton.title = "수정"
        default: break
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        contentsTextView.layer.borderColor = borderColor.cgColor
        contentsTextView.layer.borderWidth = 0.5
        contentsTextView.layer.cornerRadius = 5.0
    }
    
    private func configureDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        dateTextField.inputView = self.datePicker
    }
    
    private func configureInputField() {
        contentsTextView.delegate = self
        titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange), for: .editingChanged)
        dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange), for: .editingChanged)
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy 년 MM 월 dd 일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        diaryDate = datePicker.date
        dateTextField.text = formatter.string(from: datePicker.date)
        dateTextField.sendActions(for: .editingChanged)
    }

    @IBAction func confirmButtonPressed(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text else { return }
        guard let contents = contentsTextView.text else { return }
        guard let date = diaryDate else { return }
        let diary = Diary(title: title, contents: contents, date: date, isStar: false)
        
        switch diaryEditorMode {
        case .new:
            delegate?.didSelectRegister(diary: diary)
        case let .edit(IndexPath, _):
            NotificationCenter.default.post(name: NSNotification.Name("editDiary"),
                                            object: diary, userInfo: [ "indexPath.row": IndexPath.row ])
            
        }
        
        delegate?.didSelectRegister(diary: diary)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        validateInputField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func validateInputField() {
        confirmButton.isEnabled = !(titleTextField.text?.isEmpty ?? true) && !(dateTextField.text?.isEmpty ?? true) && !contentsTextView.text.isEmpty
    }
    
}

extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        validateInputField()
    }
}
