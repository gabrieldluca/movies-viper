@testable import Movies_Viper

class MovieListViewMock: MovieListViewProtocol {
    var presenter: MovieListPresenterProtocol?

    var didCallReloadData = false

    var didCallShowError = false
    var didCallShowErrorWith = ""

    func reloadData() {
        didCallReloadData = true
    }

    func showError(errorMessage: String) {
        didCallShowError = true
        didCallShowErrorWith = errorMessage
    }
}
