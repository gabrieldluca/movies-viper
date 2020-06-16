import UIKit

class MovieListViewController: UIViewController {
    var presenter: MovieListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension MovieListViewController: MovieListViewProtocol {
    func reloadData() {

    }

    func showError(errorMessage: String) {

    }
}
