import XCTest
import Quick
import Nimble

@testable import Movies_Viper

class MovieListViewControllerTest: QuickSpec {

    override func spec() {
        describe("MovieListViewController") {

            var view: MovieListViewController!

            beforeEach {
                view = MovieListViewController()
            }

            describe("#viewDidLoad") {
                it("set up the title as Movie List") {
                    view.viewDidLoad()
                    expect(view.title).to(equal("Movie List"))
                }
            }
        }
    }
}
