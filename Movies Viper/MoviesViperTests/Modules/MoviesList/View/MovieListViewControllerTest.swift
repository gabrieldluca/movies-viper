import XCTest
import Quick
import Nimble

@testable import Movies_Viper

class MovieListViewControllerTest: QuickSpec {

    override func spec() {
        describe("MovieListViewController") {

            var viewController: MovieListViewController!

            beforeEach {
                viewController = MovieListViewController()
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
        }
    }
}
