import UIKit

class MovieListInteractor: MovieListInteractorProtocol {
    var output: MovieListInteractorOutputProtocol?
    var dataManager: MovieListDataManagerProtocol = MovieListDataManagerFactory.shared

    func fetchMovies() {

    }
}
