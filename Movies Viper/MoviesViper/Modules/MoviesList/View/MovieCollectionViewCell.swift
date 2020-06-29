import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    public let titleLabel: UILabel = UILabel()
    public let posterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private lazy var stack: UIStackView = {
           let stack = UIStackView(arrangedSubviews: [posterImageView,
                                                      titleLabel])
           stack.distribution = .fill
           stack.axis = .vertical
           return stack
       }()

    private var indexPath: IndexPath?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with movie: Movie, indexPath: IndexPath) {
        titleLabel.text = movie.title
        self.indexPath = indexPath
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        posterImageView.image = nil
    }


    private func downloadImage(urlString: String) {
        guard let indexPath = indexPath else { return }
        ImageDataManager.shared.loadImage(urlString: urlString, indexPath: indexPath) { [unowned self] (image, oldIndexPath) in
            if oldIndexPath == self.indexPath {
                self.posterImageView.image = image
            }
        }
    }
}

extension MovieCollectionViewCell: ViewRender {
    func addConstraints() {
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
    }

    func addViewHierarchy() {
        addSubview(stack)
    }


}
