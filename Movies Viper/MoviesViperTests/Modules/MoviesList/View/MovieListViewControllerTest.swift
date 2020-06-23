import XCTest
import Quick
import Nimble

@testable import Movies_Viper

class MovieListViewControllerTest: QuickSpec {

    override func spec() {
        describe("MovieListViewController") {

            var viewController: MovieListViewController!
            var presenter: MovieListPresenterMock!

            beforeEach {
                viewController = MovieListViewController()
                presenter = MovieListPresenterMock()
                viewController.presenter = presenter
            }

            describe("#init") {
                it("sets a collectionView") {
                    expect(viewController.collectionView).toNot(beNil())
                }
            }

            describe("#viewDidLoad") {

                beforeEach {
                    viewController.viewDidLoad()
                }

                it("adds collectionView in the view hierarchy") {
                    expect(viewController.view.subviews).to(contain(viewController.collectionView))
                }

                it("set up the title as Movie List") {
                    expect(viewController.title).to(equal("Movie List"))
                }

                it("set backgroundColor to white") {
                    expect(viewController.view.backgroundColor).to(equal(.white))
                }
            }

            describe(".collectionView") {
                it("delegate is MovieListViewController") {
                    expect(viewController.collectionView.delegate).to(be(viewController))
                }

                it("dataSource is MovieListViewController") {
                    expect(viewController.collectionView.dataSource).to(be(viewController))
                }
            }

            describe("#collectionViewNumberOfItemsInSection") {
                it("returns the number of items from presenter") {
                    presenter.numberOfItemsToReturn = 6
                    let collectionView = viewController.collectionView
                    let numberOfItems = viewController.collectionView(collectionView, numberOfItemsInSection: 0)
                    expect(numberOfItems).to(equal(6))
                }
            }
        }
    }
}
