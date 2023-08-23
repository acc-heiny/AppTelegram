import UIKit

class ContactListViewController: UIViewController {

    var contactList: ContactListView = ContactListView()
    var data: [DataUser] = []
    
    override func loadView() {
        self.view = contactList
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContactList()
        contactList.delegate = self
    
    }
    
    func loadContactList() {
        
         let fileURL: URL = Bundle.main.url(forResource: "Users", withExtension: "json")!
              let jsonData = try! Data(contentsOf: fileURL)
        
        do {
            data = try JSONDecoder().decode([DataUser].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
        self.contactList.updateDataSource(contactInfo: data)
    }
}

extension ContactListViewController : ContactListViewDelegate {
    func nameOfContact(title: String) {
        
    }
}
