import UIKit

class MovieListPresenter: MovieListPresenterProtocol {
    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?
    private var movieList: [Movie] = []

    func viewWillAppear() {
        interactor?.fetchMovies()
    }

    func movie(for indexPath: IndexPath) -> Movie? {
        indexPath.row < movieList.count ? movieList[indexPath.row] : nil
    }

    func numberOfItems() -> Int {
        return movieList.count
    }
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
    func moviesDidFetch(movies: [Movie]) {
        movieList = movies
        view?.reloadData()
    }

    func moviesFailToFetch(error: Error) {
        movieList.removeAll()
        view?.showError(errorMessage: error.localizedDescription)
    }
}
