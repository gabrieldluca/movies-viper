import XCTest
import Quick
import Nimble

@testable import Movies_Viper

class MovieListPresenterTests: QuickSpec {
    override func spec() { // swiftlint:disable:this function_body_length
        describe("MovieListPresenter") {

            var presenter: MovieListPresenter!
            var view: MovieListViewMock!
            var interactor: MovieListInteractorMock!
//            var router: MovieListRouterMock!

            beforeEach {
                presenter = MovieListPresenter()
                view = MovieListViewMock()
                interactor = MovieListInteractorMock()
                presenter.view = view
                presenter.interactor = interactor
            }

            describe("#viewWillAppear") {
                it("tells the interactor to fetch movies") {
                    presenter.viewWillAppear()

                    expect(interactor.didCallFetchMovies).to(beTrue())
                }
            }

            describe("#movieForIndexPath") {
                context("the index path corresponds to a movie") {
                    it("returns the movie") {
                        let movie = Movie(title: "Parasite", releaseYear: 2019, imagePath: "oscar-winner")
                        let indexPath = IndexPath(row: 0, section: 0)

                        presenter.moviesDidFetch(movies: [movie])
                        let retrievedMovie = presenter.movie(for: indexPath)

                        expect(retrievedMovie).to(equal(movie))
                    }
                }

                context("the index path corresponds to another movie") {
                    it("returns the movie") {
                        let parasite = Movie(title: "Parasite", releaseYear: 2019, imagePath: "oscar-winner")
                        let greenBook = Movie(title: "Green Book", releaseYear: 2019, imagePath: "oscar-winner-tbm")
                        let aStarIsBorn = Movie(title: "A Star is Born", releaseYear: 2019, imagePath: "gagasim")
                        let indexPath = IndexPath(row: 1, section: 0)

                        presenter.moviesDidFetch(movies: [parasite, greenBook, aStarIsBorn])
                        let retrievedMovie = presenter.movie(for: indexPath)

                        expect(retrievedMovie).to(equal(greenBook))
                    }
                }

                context("the index path does not corresponds to a movie") {
                    it("does not return any movie") {
                        let movie = Movie(title: "Parasite", releaseYear: 2019, imagePath: "oscar-winner")
                        let indexPath = IndexPath(row: 1, section: 0)

                        presenter.moviesDidFetch(movies: [movie])
                        let retrievedMovie = presenter.movie(for: indexPath)

                        expect(retrievedMovie).to(beNil())
                    }
                }
            }

            describe("#numberOfItems") {
                context("the movies were not fetched") {
                    it("returns the default value of zero") {
                        let numberOfItems = presenter.numberOfItems()

                        expect(numberOfItems).to(equal(0))
                    }
                }

                context("the movies were fetched") {
                    it("returns the number of fetched movies") {
                        let movie = Movie(title: "Parasite", releaseYear: 2019, imagePath: "oscar-winner")

                        presenter.moviesDidFetch(movies: [movie])
                        let numberOfItems = presenter.numberOfItems()

                        expect(numberOfItems).to(equal(1))
                    }

                    context("and when fetch again the movies failed to fetch") {
                        it("returns the default value of zero") {
                            let movie = Movie(title: "Parasite", releaseYear: 2019, imagePath: "oscar-winner")

                            presenter.moviesDidFetch(movies: [movie])
                            presenter.moviesFailToFetch(error: MovieListErrorMock.myError)
                            let numberOfItems = presenter.numberOfItems()

                            expect(numberOfItems).to(equal(0))
                        }
                    }
                }

                context("the movies failed to fetch") {
                    it("returns the default value of zero") {
                        presenter.moviesFailToFetch(error: MovieListErrorMock.myError)
                        let numberOfItems = presenter.numberOfItems()

                        expect(numberOfItems).to(equal(0))
                    }
                }
            }

            describe("#moviesDidFetch") {
                it("tells the view to update itself") {
                    let movieList = [Movie(title: "Parasite", releaseYear: 2019, imagePath: "oscar-winner")]

                    presenter.moviesDidFetch(movies: movieList)

                    expect(view.didCallReloadData).to(beTrue())
                }
            }

            describe("#moviesFailToFetch") {
                it("tells the view to show an error") {
                    let error = MovieListErrorMock.myError

                    presenter.moviesFailToFetch(error: error)

                    expect(view.didCallShowError).to(beTrue())
                    expect(view.didCallShowErrorWith).to(equal(error.localizedDescription))
                }
            }
        }
    }
}
