//
//  MainPageViewController.swift
//  Gmail Clone
//
//  Created by Dmitriy Mkrtumyan on 26.06.23.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var composeIcon: UIImageView!
    @IBOutlet weak var composeBackView: UIView!
    @IBOutlet weak var composeBtn: UIButton!
    let dataSource: Array<Person> = [
        Person(
            profileIcon: UIImage(named: "Profile1")!,
            name: "Jane",
            surname: "Thompson",
            subject: "Meeting Reminder",
            message: """
                Hi team, Just a friendly reminder that our team meeting is scheduled for tomorrow at 10:00 AM in the conference room. We will be discussing the upcoming project deadlines and assigning tasks. Please come prepared with any updates or questions you may have.
                Best regards,
                Jane
                """,
            date: "June 25",
            favorite: true
        ),
        Person(
            profileIcon: UIImage(named: "Profile2")!,
            name: "Michael",
            surname: "Rodriguez",
            subject: "Vacation Request",
            message: """
                Hi HR, I hope this email finds you well. I would like to request vacation leave from July 10th to July 15th. I have already discussed this with my team, and they are aware of my absence. Please let me know if there are any forms or procedures I need to complete for this request.
                Thank you,
                Michael
                """,
            date: "June 25",
            favorite: false
        ),
        Person(
            profileIcon: UIImage(named: "Profile3")!,
            name: "Sarah",
            surname: "Johnson",
            subject: "Birthday Celebration",
            message: """
                Dear friends, I hope you are all doing great. I wanted to inform you that my birthday is coming up on July 1st. I would love to celebrate with all of you. Let's plan a get-together at my place on the 30th of June at 7:00 PM. Please RSVP by replying to this email, so I can make the necessary arrangements.
                Looking forward to seeing you all!
                Sarah
                """,
            date: "June 26",
            favorite: true
        ),
        Person(
            profileIcon: UIImage(named: "Profile4")!,
            name: "Mark",
            surname: "Stevens",
            subject: "Urgent Order Inquiry",
            message: """
                Hello sales team, I am writing to inquire about the status of my order placed on June 20th. According to the order confirmation, the estimated delivery date was supposed to be today, but I have not received any updates or tracking information. Could you please check and provide me with an update as soon as possible?
                Thank you,
                Mark
                """,
            date: "11:43 pm",
            favorite: false
        ),
        Person(
            profileIcon: UIImage(named: "Profile3")!,
            name: "Sarah",
            surname: "Johnson",
            subject: "Birthday Celebration",
            message: """
                Dear friends, I hope you are all doing great. I wanted to inform you that my birthday is coming up on July 1st. I would love to celebrate with all of you. Let's plan a get-together at my place on the 30th of June at 7:00 PM. Please RSVP by replying to this email, so I can make the necessary arrangements.
                Looking forward to seeing you all!
                Sarah
                """,
            date: "June 26",
            favorite: true
        ),
        Person(
            profileIcon: UIImage(named: "Profile3")!,
            name: "Sarah",
            surname: "Johnson",
            subject: "Birthday Celebration",
            message: """
                Dear friends, I hope you are all doing great. I wanted to inform you that my birthday is coming up on July 1st. I would love to celebrate with all of you. Let's plan a get-together at my place on the 30th of June at 7:00 PM. Please RSVP by replying to this email, so I can make the necessary arrangements.
                Looking forward to seeing you all!
                Sarah
                """,
            date: "June 26",
            favorite: true
        ),
        Person(
            profileIcon: UIImage(named: "Profile3")!,
            name: "Sarah",
            surname: "Johnson",
            subject: "Birthday Celebration",
            message: """
                Dear friends, I hope you are all doing great. I wanted to inform you that my birthday is coming up on July 1st. I would love to celebrate with all of you. Let's plan a get-together at my place on the 30th of June at 7:00 PM. Please RSVP by replying to this email, so I can make the necessary arrangements.
                Looking forward to seeing you all!
                Sarah
                """,
            date: "June 26",
            favorite: true
        )
    ]
    var searchedResults: Array<Person> = []
    var searchbarLeftIcon: UIImage {
        if let leftIcon = UIImage(named: "3xLines") {
            return leftIcon
        } else {
            return UIImage()
        }
    }
    var searchbarRightIcon: UIImage {
        if let leftIcon = UIImage(named: "PersonIcon") {
            return leftIcon
        } else {
            return UIImage()
        }
    }
    var searchFlag: Bool = false {
        didSet {
            if searchFlag {
                tableView.reloadData()
            } else {
                tableView.reloadData()
            }
        }
    }
    
    //MARK: - Implemented methods
    func setupSearchTextField() {
        searchTextField.delegate = self
        searchTextField.placeholder = "Search in mail"
        searchTextField.layer.cornerRadius = 12.0
        searchTextField.layer.shadowColor = UIColor.gray.cgColor
        searchTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        searchTextField.layer.shadowRadius = 1
        searchTextField.layer.shadowOpacity = 1
    }
    
    func setupComposeBtn() {
        if let icon = UIImage(named: "ComposeIcon")?.withTintColor(.red, renderingMode: .alwaysOriginal) {
            composeIcon.image = icon
        }
        composeBackView.layer.cornerRadius = 20
        composeBackView.layer.shadowOffset = CGSize(width: 1, height: 2)
        composeBackView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        composeBackView.layer.shadowRadius = 2
        composeBackView.layer.shadowOpacity = 1
        composeBtn.addTarget(self, action: #selector(composeBtnTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func composeBtnTapped(sender: UIButton) {
        let vc = UIStoryboard(name: "ComposePage", bundle: nil).instantiateViewController(withIdentifier: "ComposePageViewController") as! ComposePageViewController
        if let navigationController = self.navigationController {
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func tableViewConfig() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 5
        tableView.register(UINib(nibName: "TableViewCell", bundle: .main), forCellReuseIdentifier: "TableViewCell")
    }
    
    func setupTextFieldsLeftImage(_ image: UIImage, with padding: CGFloat = 0) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
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
            stackView.addArrangedSubview(imageView)
            
            searchTextField.leftView = stackView
            searchTextField.leftViewMode = .always
        } else {
            searchTextField.leftView = imageView
            searchTextField.leftViewMode = .always
        }
    }
    
    func setupTextFieldsRightImage(_ image: UIImage, with padding: CGFloat = 0) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        if padding != 0 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            let paddingView = UIView()
            paddingView.translatesAutoresizingMaskIntoConstraints = false
            paddingView.widthAnchor.constraint(equalToConstant: padding).isActive = true
            paddingView.heightAnchor.constraint(equalToConstant: padding).isActive = true
            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(paddingView)
            
            searchTextField.rightView = stackView
            searchTextField.rightViewMode = .always
        } else {
            searchTextField.rightView = imageView
            searchTextField.rightViewMode = .always
        }
    }
    
    //MARK: - Overrided methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupSearchTextField()
        setupComposeBtn()
        tableViewConfig()
        setupTextFieldsLeftImage(searchbarLeftIcon, with: 12)
    }

    override func viewDidLayoutSubviews() {
        setupTextFieldsRightImage(searchbarRightIcon, with: 12)
    }
    
    //MARK: - Actions
    
    @IBAction func editingChangedForTextField(_ sender: UITextField) {
        if let searchedText = sender.text {
            searchedResults = dataSource.filter { $0.fullname.lowercased().contains(searchedText.lowercased()) }
            print("Results of search:", searchedResults)
        }
        
        if !searchedResults.isEmpty {
            searchFlag = true
        } else {
            searchFlag = false
        }
    }
    
}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchFlag {
            return searchedResults.count
        }
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none

        if searchFlag {
            if searchedResults[indexPath.row].favorite {
                cell.flag = true
            } else {
                cell.flag = false
            }
            cell.iterateData(from: searchedResults[indexPath.row])
            return cell
        }
        
        if dataSource[indexPath.row].favorite {
            cell.flag = true
        } else {
            cell.flag = false
        }
        cell.iterateData(from: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 15, y: -5, width: view.frame.width - 1, height: 20))
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = "Primary"
        
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 20
    }
}

extension MainPageViewController: UITextFieldDelegate {
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !searchedResults.isEmpty {
            searchFlag = !searchFlag
        }
        if textField.text == nil {
            searchFlag = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == nil {
            searchFlag = false
        }
        return textField.resignFirstResponder()
    }
}
