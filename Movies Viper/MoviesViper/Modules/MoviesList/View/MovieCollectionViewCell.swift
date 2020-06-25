import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    public let titleLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with movie: Movie) {
        titleLabel.text = movie.title
    }
}
