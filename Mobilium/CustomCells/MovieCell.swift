//
//  MovieCell.swift
//  Mobilium
//
//  Created by Kerem Demır on 26.05.2023.
//

import UIKit

class MovieCell: UITableViewCell {
    static let cellIdentifier = "CustomTableViewCell"
    
    public let movieName:UILabel = {
        let movieName = UILabel()
        movieName.translatesAutoresizingMaskIntoConstraints = false
        movieName.textColor = .darkGray
        movieName.textAlignment = .left
        movieName.font = .systemFont(ofSize: 18, weight: .semibold)
        return movieName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupoorted TableViewCell!")
    }
    
    private func configure(){
        addConstraints()
    }
    
    private func addConstraints() {
        contentView.addSubview(movieName)
        NSLayoutConstraint.activate([
            movieName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            movieName.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
    }

}
