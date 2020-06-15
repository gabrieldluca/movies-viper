import UIKit

class MovieListRouter: MovieListRouterProtocol {
    weak var baseViewController: UIViewController?

    func build() -> UIViewController {
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let router = MovieListRouter()
        let viewController = MovieListViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        return viewController
    }
}
