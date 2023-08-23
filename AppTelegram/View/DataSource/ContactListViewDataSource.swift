
import Foundation
import UIKit
  
protocol CollectionViewDataSourceDelegate: AnyObject {
    func contactSelected(name:String)
}

final class ContactListViewDataSource: NSObject {
    
    weak var delegate: CollectionViewDataSourceDelegate?
    var contacts: [DataUser]
    
    init(contacts: [DataUser]) {
        self.contacts = contacts
    }
    
    func updateData(contactInfo: [DataUser]) {
        contacts = contactInfo
    }
}

extension ContactListViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        contacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let contactCell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCell", for: indexPath)
        
        guard let listContact = contactCell as? ContactListCollectionViewCell else {return UICollectionViewCell()}
        let nameContact = contacts[indexPath.row]
        listContact.prepare(text: nameContact.name, imageName: nameContact.image)
        
        return listContact
        
    }
}

extension ContactListViewDataSource: UICollectionViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactNames = contacts[indexPath.row]
        delegate?.contactSelected(name: contactNames.name)
    }
}

