import UIKit

class MovieListViewController: UIViewController {
    var presenter: MovieListPresenterProtocol?
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie List"
        view.backgroundColor = .white
    }
}

extension MovieListViewController: MovieListViewProtocol {
    func reloadData() {

    }

    func showError(errorMessage: String) {

    }
}

extension MovieListViewController: UICollectionViewDelegate {

}

extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return .init()
    }
}
