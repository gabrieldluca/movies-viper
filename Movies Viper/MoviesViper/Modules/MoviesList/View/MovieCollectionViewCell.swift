import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    public let titleLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with movie: Movie) {
        titleLabel.text = movie.title
    }
}

extension MovieCollectionViewCell: ViewRender {
    func addConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    func addViewHierarchy() {
        addSubview(titleLabel)
    }
}
