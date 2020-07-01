import XCTest
import Nimble

class MovieListRobot: Robot {
    private lazy var navigationBar = app.navigationBars["MovieListNavigationBar"]

    @discardableResult
    func checkViewTitleIs(_ title: String) -> Self {
        expect(self.navigationBar.staticTexts[title].exists).to(beTrue())
        return self
    }
}
