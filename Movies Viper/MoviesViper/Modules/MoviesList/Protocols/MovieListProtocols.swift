import UIKit

protocol MovieListViewProtocol: class {
    var presenter: MovieListPresenterProtocol? { get set }
    // Add here your methods for communication PRESENTER -> VIEW
    func reloadData()
    func showError(errorMessage: String)
}

protocol MovieListPresenterProtocol: class {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }

    // Add here your methods for communication VIEW -> PRESENTER
    func viewWillAppear()
    func movie(for indexPath: IndexPath) -> Movie?
    func numberOfRows() -> Int
}

protocol MovieListInteractorOutputProtocol: class {
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func moviesDidFetch(movies: [Movie])
    func moviesFailToFetch(error: Error)
}

protocol MovieListInteractorProtocol: class {
    var output: MovieListInteractorOutputProtocol? { get set }

    // Add here your methods for communication PRESENTER -> INTERACTOR
    func fetchMovies()
}

protocol MovieListRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
    func build() -> UIViewController
}
