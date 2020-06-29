import Foundation

protocol MovieListDataManagerProtocol: AnyObject {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MovieListDataManager: MovieListDataManagerProtocol {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        return completion(.success([.init(title: "Bacurau",
                                   releaseYear: 2019,
                                   imagePath: "http://i.pinimg.com/474x/10/67/e0/1067e05abb594b199fab8f6f8524885f.jpg"),
                                    .init(title: "Knifes out",
                                    releaseYear: 2020,
                                   imagePath: "http://i.pinimg.com/474x/10/67/e0/1067e05abb594b199fab8f6f8524885f.jpg"),
                                    .init(title: "O Poço",
                                    releaseYear: 2019,
                                    imagePath: "http://i.pinimg.com/474x/10/67/e0/1067e05abb594b199fab8f6f8524885f.jpg")
        ]))
    }
}

class MovieListDataManagerFactory {
    static var shared: MovieListDataManagerProtocol = MovieListDataManager()
}
