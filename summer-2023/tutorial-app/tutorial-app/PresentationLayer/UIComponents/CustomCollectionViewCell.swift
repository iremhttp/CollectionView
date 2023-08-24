import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    let iconView: UIImageView = UIImageView()
    let label: UILabel = UILabel()
    let sublabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI() {
        contentView.backgroundColor = .black
        
        layer.cornerRadius = 10
            layer.borderWidth = 1
            layer.borderColor = UIColor.darkGray.cgColor
        
        contentView.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            iconView.widthAnchor.constraint(equalToConstant: 24)
        ])
        iconView.layer.cornerRadius = 12
        iconView.clipsToBounds = true
        iconView.layer.masksToBounds = true
        iconView.backgroundColor = .systemPink

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 4)
        ])

        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .purple

        contentView.addSubview(sublabel)
        sublabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sublabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sublabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            sublabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        sublabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        sublabel.textColor = .cyan
    }

}
