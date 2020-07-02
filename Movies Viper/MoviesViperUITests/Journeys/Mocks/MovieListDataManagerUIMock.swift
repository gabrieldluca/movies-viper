import Foundation

class MovieListDataManagerUIMock: MovieListDataManagerProtocol {

    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let movies: [Movie] = [
            Movie(title: "Bacurau",
                  releaseYear: 2019,
                  imagePath: "https://i.pinimg.com/474x/10/67/e0/1067e05abb594b199fab8f6f8524885f.jpg"),
            Movie(title: "Avengers: Endgame",
                  releaseYear: 2019,
                  imagePath: "https://universoreverso.com.br/wp-content/uploads/2019/03/avengers-endgame-poster.jpg"),
            Movie(title: "Your Name",
                  releaseYear: 2016,
                  imagePath: "https://upload.wikimedia.org/wikipedia/pt/7/7f/Kimi-no-Na-wa-poster.jpg")
        ]
        completion(.success(movies))
    }
}
