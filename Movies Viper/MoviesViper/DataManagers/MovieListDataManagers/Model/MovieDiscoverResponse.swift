import Foundation

// MARK: - MovieDiscoverResponse
struct MovieDiscoverResponse: Codable {
    let page, totalResults, totalPages: Int
    let movieModel: [MovieModel]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movieModel = "results"
    }
}

// MARK: - MovieModel
struct MovieModel: Codable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let idValue: Int
    let adult: Bool
    let backdropPath, originalLanguage, originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case idValue = "id"
        case adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}
