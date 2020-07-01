import Foundation

class MovieListDataManagerUIMock: MovieListDataManagerProtocol {

    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let movies: [Movie] = [ .init(title: "Bacurau",
                                      releaseYear: 2019,
                                      imagePath: "https://i.pinimg.com/474x/10/67/e0/1067e05abb594b199fab8f6f8524885f.jpg")]
        completion(.success(movies))
    }
}
