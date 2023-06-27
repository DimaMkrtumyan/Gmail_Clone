//
//  ComposePageViewController.swift
//  Gmail Clone
//
//  Created by Dmitriy Mkrtumyan on 27.06.23.
//

import UIKit

class ComposePageViewController: UIViewController {

    @IBOutlet weak var personTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var fromBtn: UIButton!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var goBackBtn: UIButton!
    @IBOutlet weak var attachFileBtn: UIButton!
    @IBOutlet weak var sendMessageBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
    // MARK: - Implemented methods
    func setupPersonTextField(text: String, with padding: CGFloat = 0) {
        personTextField.borderStyle = .none
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 30).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true

        if padding != 0 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
        
            let paddingView = UIView()
            paddingView.translatesAutoresizingMaskIntoConstraints = false
            paddingView.widthAnchor.constraint(equalToConstant: padding).isActive = true
            paddingView.heightAnchor.constraint(equalToConstant: padding).isActive = true
            stackView.addArrangedSubview(paddingView)
            stackView.addArrangedSubview(label)
            
            personTextField.leftView = stackView
            personTextField.leftViewMode = .always
        } else {
            personTextField.leftView = UIView()
            personTextField.leftViewMode = .always
        }
    }
    
    func setupSubjectTextField() {
        subjectTextField.placeholder = "Subject"
        subjectTextField.borderStyle = .none
    }
    
    @objc func fromBtnTapped(sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "MailAddressViewController") as! MailAddressViewController
        vc.completion = { mail in
            self.fromBtn.setTitle(mail, for: .normal)
        }
        self.navigationController?.present(vc, animated: true)
    }
    
    func setupNavigationButtons() {
        guard let closeImg = UIImage(named: "closeIcon")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal),
              let attachImg = UIImage(named: "attach")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal),
              let sendImg = UIImage(named: "send")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal),
              let moreImg = UIImage(named: "more")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        else { return }

        goBackBtn.backgroundColor = .clear
        goBackBtn.setImage(closeImg, for: .normal)
        sendMessageBtn.backgroundColor = .clear
        sendMessageBtn.setImage(sendImg, for: .normal)
        attachFileBtn.backgroundColor = .clear
        attachFileBtn.setImage(attachImg, for: .normal)
        moreBtn.backgroundColor = .clear
        moreBtn.setImage(moreImg, for: .normal)
        goBackBtn.contentMode = .scaleAspectFill
        sendMessageBtn.contentMode = .scaleAspectFill
        attachFileBtn.contentMode = .scaleAspectFill
        moreBtn.contentMode = .scaleAspectFill
        
        goBackBtn.addTarget(self, action: #selector(goBackTapped), for: .touchUpInside)
        attachFileBtn.addTarget(self, action: #selector(attachTapped), for: .touchUpInside)
        sendMessageBtn.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        moreBtn.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
    }
    
    @objc func goBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func attachTapped() {
        print("Attach file.")
    }
    
    @objc func sendTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func moreTapped() {
        print("More.")
    }
    
    // MARK: - Overrided methods
    func setupMessageTextView() {
        messageTextView.text = "Insert message"
        messageTextView.textColor = UIColor.lightGray
        messageTextView.selectedTextRange = messageTextView.textRange(from: messageTextView.beginningOfDocument, to: messageTextView.beginningOfDocument)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPersonTextField(text: "To", with: 1)
        setupSubjectTextField()
        setupNavigationButtons()
        setupMessageTextView()
        fromBtn.addTarget(self, action: #selector(fromBtnTapped(sender:)), for: .touchUpInside)
    }

}

extension ComposePageViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Insert message"
            textView.textColor = UIColor.lightGray
        }
    }
}
