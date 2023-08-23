import UIKit
import SnapKit

 class ContactListCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "contactCell"
    
    lazy var nameOfContact: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.font = UIFont(name: "Futura", size: 20)
        label.textColor = .black
        label.layer.borderColor = UIColor.black.cgColor
        return label
        
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
     override init(frame: CGRect = .zero) {
         super.init(frame: frame)
         setupView()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     func prepare(text: String, imageName: String) {
        nameOfContact.text = text
        userImageView.image = UIImage(named: imageName)
    }
}

extension ContactListCollectionViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        contentView.addSubview(nameOfContact)
        contentView.addSubview(userImageView)
    }
    
    func setupConstraints() {
        
        userImageView.snp.makeConstraints{ make in
            
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(snp.leading)
        }
        
        nameOfContact.snp.makeConstraints { make in
            
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(userImageView.snp.trailing)
            
        }
    }
    
    func setupConfiguration() {
        
    }
}
