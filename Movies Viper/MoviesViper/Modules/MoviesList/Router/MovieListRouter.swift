import UIKit

class MovieListRouter: MovieListRouterProtocol {
    weak var baseViewController: UIViewController?

    func build() -> UIViewController {
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let viewController = MovieListViewController()

        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = self
        interactor.output = presenter
        baseViewController = viewController

         let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
