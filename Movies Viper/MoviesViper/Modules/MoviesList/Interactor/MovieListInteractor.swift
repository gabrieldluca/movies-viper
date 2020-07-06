import UIKit

class MovieListInteractor: MovieListInteractorProtocol {
    weak var output: MovieListInteractorOutputProtocol?
    var dataManager: MovieListDataManagerProtocol = MovieListDataManagerFactory.shared

    func fetchMovies() {
        dataManager.fetchMovies { [weak self] (result) in
            switch result {
            case .success(let movies):
                self?.output?.moviesDidFetch(movies: movies)
            case .failure(let error):
                self?.output?.moviesFailToFetch(error: error)
            }
        }
    }
}
