import XCTest
import Quick
import Nimble

class MovieListUITests: QuickSpec {
    private lazy var app = XCUIApplication()
    var robot: MovieListRobot!

    override func spec() {
        beforeSuite {
            self.app.launchArguments.append("UITesting")
            self.app.launch()
            self.robot = MovieListRobot(app: self.app)
        }

        describe("MovieList Smoke Test") {
            context("in movie list scenne") {
                it("show a list of movies") {
                    self.robot.checkViewTitleIs("Movie List")
                }
            }
        }
    }
}
