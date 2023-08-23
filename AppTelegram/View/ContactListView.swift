
import UIKit
import SnapKit

protocol ContactListViewDelegate: AnyObject {
    func nameOfContact(title: String)
}

class ContactListView: UIView {
    
    var dataSource: ContactListViewDataSource = .init(contacts: [])
    weak var delegate: ContactListViewDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let collectionLayout: UICollectionViewFlowLayout = .init()
        collectionLayout.itemSize = .init(width: UIScreen.main.bounds.size.width, height: 100)
        collectionLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.backgroundColor = .white
        collection.register(ContactListCollectionViewCell.self, forCellWithReuseIdentifier: "contactCell")
        return collection
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDataSource(contactInfo: [DataUser]) {
        dataSource.updateData(contactInfo: contactInfo)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension ContactListView: ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        
    collectionView.snp.makeConstraints { make in
            
        make.top.equalTo(safeAreaLayoutGuide.snp.top)
        make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
        make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
        
        }
    }
    
    func setupConfiguration() {
        backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        dataSource.delegate = self
    }
}

extension ContactListView: CollectionViewDataSourceDelegate {
    func contactSelected(name: String) {
        delegate?.nameOfContact(title: name)
    }
}

