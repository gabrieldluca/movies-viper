import XCTest
import Nimble

class MovieListRobot: Robot {
    private lazy var navigationBar = app.navigationBars["MovieListNavigationBar"]
    private lazy var collection = app.collectionViews["MovieListCollection"]
    private lazy var firstCell = collection.cells["Cell [0, 0]"]

    @discardableResult
    func checkViewTitleIs(_ title: String) -> Self {
        expect(self.navigationBar.staticTexts[title].exists).to(beTrue())
        return self
    }

    @discardableResult
    func checkCellTitleAt(index: Int, is title: String) -> Self {
        let cell = collection.cells["Cell [0, \(index)]"]
        expect(cell.staticTexts["Title"].label).to(equal(title))
        return self
    }
    
    @discardableResult
    func checkCellsCountEqual(_ value: Int) -> Self {
        expect(self.collection.cells.count).to(equal(value))
        return self
    }

}
