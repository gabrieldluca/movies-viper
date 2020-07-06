import Foundation

protocol MovieListDataManagerProtocol: AnyObject {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MovieListDataManager: MovieListDataManagerProtocol {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let baseUrl = "https://api.themoviedb.org/3/discover/movie"
        let apiKey = "?api_key=305517763634d75923ab75f2c23235b5"
        let path = "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
        guard let url = URL(string: baseUrl + apiKey + path) else { return }

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if let error = error {
                print("Couldn't acess end point ", error)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data = data,
                  let movieDiscoverResponse = try? JSONDecoder().decode(MovieDiscoverResponse.self, from: data),
                  let movieList = self?.convertMovieResponseToMovieEntity(movieResponse: movieDiscoverResponse)
            else { return  }

            DispatchQueue.main.async {
                completion(.success(movieList))
            }
        }

        DispatchQueue.global(qos: .background).async {
            dataTask.resume()
        }

    }

    func convertMovieResponseToMovieEntity(movieResponse: MovieDiscoverResponse) -> [Movie] {
        movieResponse.movieModel.map { (model) -> Movie in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: model.releaseDate) ?? Date()
            let year = Calendar.current.component(.year, from: date)

            return Movie(title: model.originalTitle,
                  releaseYear: year,
                  imagePath: "https://image.tmdb.org/t/p/w154/" + model.posterPath )
        }
    }
}

class MovieListDataManagerFactory {
    static var shared: MovieListDataManagerProtocol = MovieListDataManager()
}
