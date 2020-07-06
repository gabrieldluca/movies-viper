import XCTest
import Quick
import Nimble

@testable import Movies_Viper

class MovieListInteractorTests: QuickSpec {

    override func spec() {
        describe("MovieListInteractor") {

            var interactor: MovieListInteractor!
            var dataManager: MovieListDataManagerMock!
            var output: MovieListInteractorOutputMock!

            beforeEach {
                interactor = MovieListInteractor()
                dataManager = MovieListDataManagerMock()
                output = MovieListInteractorOutputMock()
                interactor.dataManager = dataManager
                interactor.output = output
            }

            describe("#fetchMovies") {
                context("the movies were fetched successfully") {
                    it("return the movie list to the output") {
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
                        let error = MovieListErrorMock.myError
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
}
