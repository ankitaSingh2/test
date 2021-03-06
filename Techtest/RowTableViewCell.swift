//
//  TableViewCell.swift
//  Techtest
//
//  Created by Ankita on 10/11/20.
//  Copyright © 2020 Ankita. All rights reserved.
//

import UIKit
// MARK: - custom table view cell 
class RowTableViewCell: UITableViewCell {
        var field:RowField? {
            didSet {
                guard let contactItem = field else {return}
                if let name = contactItem.title {
                    if let imageurl = contactItem.imageHref{
                     profileImageView.imageFromUrl(urlString: imageurl)
                    }
                    else
                    {
                        profileImageView.image = UIImage(named: "no-image-icon-33")
                    }
                    
                    
                    nameLabel.text = name
                }
                if let jobTitle = contactItem.description {
                    jobTitleDetailedLabel.text = " \(jobTitle) "
                }
                
            }
        }
        
        let containerView:UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true // this will make sure its children do not go out of the boundary
            return view
        }()
        
        let profileImageView:UIImageView = {
            let img = UIImageView()
            img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
            img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
            img.layer.cornerRadius = 35
            img.clipsToBounds = true
            return img
        }()
        
        let nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let jobTitleDetailedLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 13)
            label.textColor =  .white
            label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byCharWrapping
            label.numberOfLines = 2
            return label
        }()
        
// mark: setup custom tableview cell
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            self.contentView.addSubview(profileImageView)
            containerView.addSubview(nameLabel)
            containerView.addSubview(jobTitleDetailedLabel)
            self.contentView.addSubview(containerView)
            
            profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
            profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(SIConstants.sizeConstantlead)).isActive = true
            profileImageView.widthAnchor.constraint(equalToConstant:CGFloat(SIConstants.sizeConstantheight)).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant:CGFloat(SIConstants.sizeConstantheight)).isActive = true
            
            containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
            containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:CGFloat(SIConstants.sizeConstantlead)).isActive = true
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
            containerView.heightAnchor.constraint(equalToConstant:CGFloat(SIConstants.sizeConstantheight)).isActive = true
            
            nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
            nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
            
            jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
            jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
            jobTitleDetailedLabel.heightAnchor.constraint(equalToConstant:40).isActive = true

        }
        
        required init?(coder aDecoder: NSCoder) {
            
            super.init(coder: aDecoder)
        }

    }
extension UIImageView {
    func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url as URL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }

            }
        }
    }
    }
}
extension UILabel {
    func calculateMaxLines(actualWidth: CGFloat?) -> Int {
        var width = frame.size.width
        if let actualWidth = actualWidth {
            width = actualWidth
        }
        let maxSize = CGSize(width: width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}

