import UIKit

class MovieListViewController: UIViewController {
    var presenter: MovieListPresenterProtocol?
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        let identifier = String(describing: MovieCollectionViewCell.self)
        collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie List"
        view.backgroundColor = .white
        setUp()
    }
}

extension MovieListViewController: MovieListViewProtocol {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    func showError(errorMessage: String) {

    }
}

extension MovieListViewController: UICollectionViewDelegate {

}

extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: MovieCollectionViewCell.self)

        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MovieCollectionViewCell,
            let movie = presenter?.movie(for: indexPath) else {
            return .init()
        }
        cell.configure(with: movie)
        return cell
    }
}

extension MovieListViewController: ViewRender {
    func addViewHierarchy() {
        view.addSubview(collectionView)
    }

    func addConstraints() {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
