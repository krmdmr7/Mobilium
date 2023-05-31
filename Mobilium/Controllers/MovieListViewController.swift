//
//  MovieListViewController.swift
//  Mobilium
//
//  Created by Kerem Demır on 26.05.2023.
//

import UIKit

class MovieListViewController: UIViewController {
    //MARK: - UI Elements
    private let movieListView = MovieListView()
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        configure()
    }
    
    //MARK: - Functions
    private func configure(){
        view.addSubview(movieListView)
        NSLayoutConstraint.activate([
            movieListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            movieListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    //MARK: - Actions
}
