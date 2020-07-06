@testable import Movies_Viper

class MovieListInteractorMock: MovieListInteractorProtocol {
    var output: MovieListInteractorOutputProtocol?

    var didCallFetchMovies = false

    func fetchMovies() {
        didCallFetchMovies = true
    }
}
