import UIKit
import SnapKit

protocol LoginViewDelegate: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}
class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    lazy var logoAppImageView:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo 1")
        image.tintColor = .green
        image.contentMode = .scaleToFill
        return image
    }()
    
    var userNameTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.keyboardType = .emailAddress
        title.placeholder = "Username"
        title.borderStyle = .roundedRect
        title.font = UIFont.systemFont(ofSize: 20)
        title.textColor = .black
        title.backgroundColor = .white
        title.textAlignment = .left
        return title
    }()
    
    lazy var passwordTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.keyboardType = .default
        title.placeholder = "Password"
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
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.layer.cornerRadius = 7.5
        button.setTitle("Login Account", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedloginAcountButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New user? Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedRegisterAccountButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate) {
      userNameTextField.delegate = delegate
      passwordTextField.delegate = delegate
        
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    @objc func tappedloginAcountButton() {
        delegate?.actionLoginButton()
        
    }
    @objc func tappedRegisterAccountButton() {
        delegate?.actionRegisterButton()
       
    }
    
    public func validationTextFields() {
        
        let email: String = userNameTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if email.isEmpty && password.isEmpty {
            loginButton.setTitleColor(.lightGray, for: .normal)
            loginButton.isEnabled = false
        } else {
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.isEnabled = true
        }
        
    }
    
    public func getEmail() -> String {
        return userNameTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return passwordTextField.text ?? ""
        
    }
}

extension LoginView: ViewConfiguration {
    func buildViewHierarchy() {
        
        addSubview(logoAppImageView)
        textFieldContainer.addArrangedSubview(userNameTextField)
        textFieldContainer.addArrangedSubview(passwordTextField)
        addSubview(textFieldContainer)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    func setupConstraints() {
        
        logoAppImageView.snp.makeConstraints { make in
            
            make.width.equalTo(120)
            make.height.equalTo(150)
            make.leading.equalTo(25).offset(20)
            make.trailing.equalTo(25).inset(20)
            make.top.equalTo(200)
            
        }
            
        textFieldContainer.snp.makeConstraints { make in
            make.left.right.equalTo(54).inset(20)
            make.top.equalTo(450)
            make.width.equalTo(150)
            make.height.equalTo(100)
        }
        
        loginButton.snp.makeConstraints { make in
            
            make.width.equalTo(200)
            make.height.equalTo(53)
            make.leading.equalTo(38).offset(20)
            make.trailing.equalTo(38).inset(20)
            make.top.equalTo(600)
        }
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(53)
            make.leading.equalTo(38).offset(20)
            make.trailing.equalTo(38).inset(20)
            make.top.equalTo(750)
        }
    }
    
    func setupConfiguration() {
        backgroundColor = UIColor(red: 15/255, green: 100/255, blue: 90/255, alpha: 1.0)
    }
}
