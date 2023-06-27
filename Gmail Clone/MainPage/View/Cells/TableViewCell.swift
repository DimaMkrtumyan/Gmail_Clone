//
//  TableViewCell.swift
//  Gmail Clone
//
//  Created by Dmitriy Mkrtumyan on 27.06.23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var favoriteIcon: UIButton!
    var filledIcon: UIImage {
        if let icon = UIImage(named: "VectorStarIconFilled") {
            return icon
        } else {
            return UIImage()
        }
    }
    var unfilledIcon: UIImage {
        if let icon = UIImage(named: "VectorStarIconUnFilled") {
            return icon
        } else {
            return UIImage()
        }
    }
    var flag: Bool = false {
        didSet {
            if flag {
                favoriteIcon.setImage(filledIcon, for: .normal)
            } else {
                favoriteIcon.setImage(unfilledIcon, for: .normal)
            }
        }
    }
    
    // MARK: - Overrided methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 12, bottom: 0, right: 12))
    }
    
    // MARK: - Implemented methods
    func isFavorite(_ boolean: Bool) {
        if boolean {
            favoriteIcon.setImage(filledIcon, for: .normal)
        }
        favoriteIcon.setImage(unfilledIcon, for: .normal)
    }
    
    func iterateData(from person: Person) {
        profileIcon.image = person.profileIcon
        fullname.text = person.fullname
        subject.text = person.subject
        message.text = person.message
    }
    
    // MARK: - Actions
    @IBAction func favoriteBtnTapped(_ sender: UIButton) {
        flag = !flag
    }
}
