import UIKit

class MovieListPresenter: MovieListPresenterProtocol {
    var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
}
