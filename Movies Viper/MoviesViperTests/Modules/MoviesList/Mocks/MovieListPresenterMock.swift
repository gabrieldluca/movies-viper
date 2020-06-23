@testable import Movies_Viper
import UIKit

class MovieListPresenterMock: MovieListPresenterProtocol {
    var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?

    var numberOfItemsToReturn = 0
    var didCallViewWillAppear = false
    var didCallMovieForIndexPathWith: IndexPath!

    func viewWillAppear() {
        didCallViewWillAppear = true
    }

    func movie(for indexPath: IndexPath) -> Movie? {
        didCallMovieForIndexPathWith = indexPath
        return nil
    }

    func numberOfItems() -> Int {
        numberOfItemsToReturn
    }


}
