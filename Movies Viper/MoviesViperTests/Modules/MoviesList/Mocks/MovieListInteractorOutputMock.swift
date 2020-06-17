@testable import Movies_Viper

class MovieListInteractorOutputMock: MovieListInteractorOutputProtocol {
    var didCallMoviesDidFetch: Bool = false
    var didCallMoviesDidFetchWith: [Movie] = []

    var didCallMoviesFailToFetch: Bool = false
    var didCallMoviesFailToFetchWith: Error?

    func moviesDidFetch(movies: [Movie]) {
        didCallMoviesDidFetch = true
        didCallMoviesDidFetchWith = movies
    }

    func moviesFailToFetch(error: Error) {
        didCallMoviesFailToFetch = true
        didCallMoviesFailToFetchWith = error
    }

}
