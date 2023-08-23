import UIKit
import SnapKit

protocol RegisterUserViewDelegate: AnyObject {
    func tappedRegisterButton()
}

class RegisterView: UIView {
    
    weak var delegate: RegisterUserViewDelegate?
    
    lazy var UserAppImageView:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var registerUserNameTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.keyboardType = .emailAddress
        title.placeholder = "New Username"
        title.borderStyle = .roundedRect
        title.font = UIFont.systemFont(ofSize: 20)
        title.textColor = .black
        title.backgroundColor = .white
        title.textAlignment = .left
        return title
    }()
    
    lazy var registerPasswordTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.keyboardType = .default
        title.placeholder = "New Password"
        title.borderStyle = .roundedRect
        title.font = UIFont.systemFont(ofSize: 20)
        title.isSecureTextEntry = true
        title.textColor = .black
        title.backgroundColor = .white
        title.textAlignment = .left
        return title
    }()
    
    lazy var textFieldContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.layer.cornerRadius = 7.5
        button.isEnabled = false
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(tappedRegisterAccountButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate) {
        registerUserNameTextField.delegate = delegate
        registerPasswordTextField.delegate = delegate
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedRegisterAccountButton() {
        delegate?.tappedRegisterButton()
        
    }
    
    public func validationTextFields() {
        
        let email: String = registerUserNameTextField.text ?? ""
        let password: String = registerPasswordTextField.text ?? ""
        
        if email.isEmpty && password.isEmpty {
            registerButton.setTitleColor(.lightGray, for: .normal)
            registerButton.isEnabled = false
        } else {
            registerButton.setTitleColor(.white, for: .normal)
            registerButton.isEnabled = true
        }
        
    }
    
    public func getEmail() -> String {
        return registerUserNameTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return registerPasswordTextField.text ?? ""
        
    }
}

extension RegisterView: ViewConfiguration {
    func buildViewHierarchy() {
        
        addSubview(UserAppImageView)
        textFieldContainer.addArrangedSubview(registerUserNameTextField)
        textFieldContainer.addArrangedSubview(registerPasswordTextField)
        addSubview(textFieldContainer)
        addSubview(registerButton)
    }
    
    func setupConstraints() {
        
        UserAppImageView.snp.makeConstraints { make in
            
            make.width.equalTo(180)
            make.height.equalTo(180)
            make.leading.equalTo(30).offset(20)
            make.trailing.equalTo(30).inset(20)
            make.top.equalTo(200)
            make.centerX.equalTo(150)
            make.centerY.equalTo(150)
        }
            
        textFieldContainer.snp.makeConstraints { make in
            make.left.right.equalTo(54).inset(20)
            make.top.equalTo(450)
            make.width.equalTo(150)
            make.height.equalTo(100)
        }
        
        registerButton.snp.makeConstraints { make in
            
            make.width.equalTo(200)
            make.height.equalTo(53)
            make.leading.equalTo(38).offset(20)
            make.trailing.equalTo(38).inset(20)
            make.top.equalTo(600)
        }
    }
    
    func setupConfiguration() {
        backgroundColor = UIColor(red: 15/255, green: 100/255, blue: 90/255, alpha: 1.0)
    }
}

   

