//
//  PopularViewController.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation
import UIKit

class PopularViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    var searchActive : Bool = false
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.keyboardDismissMode = .onDrag
        self.tableView.register(UINib(nibName: "MovieItemCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        self.searchBar.delegate = self
        self.setupToHideKeyboardOnTapOnView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadPopularMovies()
        
        //request movies
    }
    
    func loadPopularMovies(){
        TMDBClient.getPopularMovies(completion: {
            movies in
                print(movies)
            
            self.movies = movies
            DispatchQueue.main.async{
            self.tableView.reloadData()
            }
            
        })
    }
}

extension PopularViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieItemCell
        cell.setMovie(movie: movies[indexPath.row])
        return cell
    }
}

extension PopularViewController: UISearchBarDelegate {
    func doSearch() {
        if searchBar.text! != "" {
            TMDBClient.searchMovies(query: searchBar.text!, completion: {
                movies in
                self.movies = movies ?? [Movie(title: "No hay resultados", overview: ":(", rating: 0, posterPath: "", date: "2022")]
                DispatchQueue.main.async {
                    self.tableView.reloadData()
            }
        })
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.doSearch()
        searchBar.endEditing(true)
        searchActive = false;
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.loadPopularMovies()
        searchBar.endEditing(true)
        searchActive = false;
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.doSearch()
        searchBar.endEditing(true)
        searchActive = false;
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.loadPopularMovies()
        }else{
            self.doSearch()
        }
    }
    
}

extension UIViewController
{
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
