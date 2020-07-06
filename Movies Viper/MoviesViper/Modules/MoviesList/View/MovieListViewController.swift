import UIKit

class MovieListViewController: UIViewController {
    var presenter: MovieListPresenterProtocol?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .systemBackground
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.accessibilityIdentifier = "MovieListCollection"
        let identifier = String(describing: MovieCollectionViewCell.self)
        collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie List"
        navigationController?.navigationBar.accessibilityIdentifier = "MovieListNavigationBar"
        view.backgroundColor = .systemBackground
        setUp()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
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

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let referenceValue = view.frame.width
        let spacingBetweenCells = 30 / 320 * referenceValue

        let width: CGFloat = (referenceValue - spacingBetweenCells * 2) / 3
        let heightProportion: CGFloat = 148 / 90
        let height: CGFloat = heightProportion * width

        return .init(width: width, height: height )
    }

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
        cell.configure(with: movie, indexPath: indexPath)
        return cell
    }
}

extension MovieListViewController: ViewRender {
    func addViewHierarchy() {
        view.addSubview(collectionView)
    }

    func addConstraints() {
        let padding = 16 / 320 * UIScreen.main.bounds.width
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
    }
}
