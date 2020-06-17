import XCTest
import Quick
import Nimble

@testable import Movies_Viper

class MovieListInteractorTests: QuickSpec {

    override func spec() {
        describe("MovieListInteractor") {
            describe("#fetchMovies") {
                context("the movies were fetched successfully") {
                    it("return the movie list to the output") {
                        let interactor = MovieListInteractor()
                        let dataManager = MovieListDataManagerMock()
                        let output = MovieListInteractorOutputMock()
                        interactor.dataManager = dataManager
                        interactor.output = output
                        let movies = [Movie(title: "La La Land", releaseYear: 2016, imagePath: "google.com")]
                        dataManager.mockResult = .success(movies)

                        interactor.fetchMovies()

                        expect(output.didCallMoviesDidFetch).to(beTrue())
                        expect(output.didCallMoviesDidFetchWith).to(equal(movies))
                        expect(dataManager.didCallFetchMovies).to(beTrue())

                    }
                }
                context("the movies were not fetched successfully") {
                    it("return the error to the output") {
                        let interactor = MovieListInteractor()
                        let dataManager = MovieListDataManagerMock()
                        let output = MovieListInteractorOutputMock()
                        interactor.dataManager = dataManager
                        interactor.output = output
                        let error = MockError.myError
                        dataManager.mockResult = .failure(error)

                        interactor.fetchMovies()

                        expect(output.didCallMoviesFailToFetch).to(beTrue())
                        expect(output.didCallMoviesFailToFetchWith).to(matchError(error))
                        expect(dataManager.didCallFetchMovies).to(beTrue())

                    }
                }
            }
        }
    }
    enum MockError: Error {
        case myError
    }
}
