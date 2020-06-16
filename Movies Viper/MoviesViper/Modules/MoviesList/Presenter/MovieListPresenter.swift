import UIKit

class MovieListPresenter: MovieListPresenterProtocol {
    var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?

    func viewWillAppear() {
    }

    func movie(for indexPath: IndexPath) -> Movie? {
        return nil
    }

    func numberOfRows() -> Int {
        return 0
    }
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
    func moviesDidFetch(movies: [Movie]) {

    }

    func moviesFailToFetch(error: Error) {

    }
}
