//
//  MovieListView.swift
//  Mobilium
//
//  Created by Kerem Demır on 1.06.2023.
//

import UIKit

final class MovieListView: UIView {
    
    let movies = ["Iron Man", "Cold War", "Shooter", "Tokyo Drift", "Kurtlar Vadisi Pusu", "Passengers", "Spektral","Spider Man","Captan America","God of War"]
    
    private let movieTableView: UITableView = {
        let movieTableView = UITableView()
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.cellIdentifier)
        return movieTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addConstraints()
    }
    
    private func addConstraints(){
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        addSubview(movieTableView)
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension MovieListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellIdentifier, for: indexPath) as? MovieCell else {
            fatalError("Unsupported cell..")
        }
        cell.movieName.text = movies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        showAlert(with: selectedMovie)
        tableView.deselectRow(at: indexPath, animated: true) // Hücre seçimini kaldır
    }
    
    func showAlert(with movie: String) {
        guard let viewController = self.parentViewController else {
            return
        }
        
        let alertController = UIAlertController(title: movie, message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(action)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
