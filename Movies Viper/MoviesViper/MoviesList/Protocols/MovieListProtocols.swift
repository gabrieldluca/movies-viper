import UIKit

protocol MovieListViewProtocol: class {
    var presenter: MovieListPresenterProtocol? {get set}
    // Add here your methods for communication PRESENTER -> VIEW
}

protocol MovieListPresenterProtocol: class {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }

    // Add here your methods for communication VIEW -> PRESENTER
}

protocol MovieListInteractorOutputProtocol: class {
    // Add here your methods for communication INTERACTOR -> PRESENTER
}

protocol MovieListInteractorProtocol: class {
    var output: MovieListInteractorOutputProtocol? { get set }

    // Add here your methods for communication PRESENTER -> INTERACTOR

}

protocol MovieListRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
    func build() -> UIViewController

}
