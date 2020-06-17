@testable import Movies_Viper
class MovieListDataManagerMock: MovieListDataManagerProtocol {
    var mockResult: Result<[Movie], Error>?
    var didCallFetchMovies = false

    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        didCallFetchMovies = true
        guard let mockResult = mockResult else { return }
        completion(mockResult)
    }
}
