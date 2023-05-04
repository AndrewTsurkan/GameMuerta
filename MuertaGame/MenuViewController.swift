
import UIKit

class MenuViewController: UIViewController {
    
    private var stackView = UIStackView()
    private var playButton = UIButton()
    private var rulesButton = UIButton()
    private var levelButton = UIButton()
    private var policyButton = UIButton()
    private var exitButton = UIButton()
    private let menuLabel = UILabel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        setupButton()
        setupStackView()
        view.layer.contents = UIImage(imageLiteralResourceName: "BackgroundView").cgImage
        navigationItem.hidesBackButton = true

    }
    
    private func setupStackView(){
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        
        [stackView.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: 10),
         stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90),
         stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)].forEach{ $0.isActive = true }
    }
    
    private func setupButton() {
        stackView.addArrangedSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("PLAY", for: .normal)
        playButton.addTarget(self, action: #selector(actionPlayButton), for: .touchUpInside)
        
        stackView.addArrangedSubview(rulesButton)
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        rulesButton.setTitle("RULES", for: .normal)


        rulesButton.addTarget(self, action: #selector(actionRulesButton), for: .touchUpInside )
        
        stackView.addArrangedSubview(levelButton)
        levelButton.translatesAutoresizingMaskIntoConstraints = false
        levelButton.setTitle("LEVEL", for: .normal)

        levelButton.addTarget(self, action: #selector(actionLevelButton), for: .touchUpInside )
        
        stackView.addArrangedSubview(policyButton)
        policyButton.translatesAutoresizingMaskIntoConstraints = false
        policyButton.setTitle("POLICY", for: .normal)
        policyButton.addTarget(self, action: #selector(actionPolicyButton), for: .touchUpInside)

        
        stackView.addArrangedSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.setTitle("EXIT", for: .normal)

        exitButton.addTarget(self, action: #selector(actionExitButton), for: .touchUpInside )
        
        let menuButton = [playButton,rulesButton,levelButton,policyButton,exitButton]
        menuButton.forEach({ $0.setBackgroundImage(UIImage(named: "button"), for: .normal)})
        menuButton.forEach({$0.titleLabel?.font = UIFont(name: "IrishGrover-Regular", size: 26)})
    }
    
    private func setupImageView() {
        view.addSubview(menuLabel)
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.text = "MENU"
        menuLabel.font = UIFont(name: "IrishGrover-Regular", size: 40)
        menuLabel.textAlignment = .center
        menuLabel.textColor = .white
        
        [menuLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
         menuLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
         menuLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)].forEach{ $0.isActive = true }
    }
    
    @objc private func actionRulesButton() {
        let rulesVC = RulesViewController()
        navigationController?.pushViewController(rulesVC, animated: true)
    }
    
    @objc private func actionLevelButton() {
        let selectLvl = SelectLevelViewController()
        navigationController?.pushViewController(selectLvl, animated: true)
    }
    
    @objc private func actionExitButton() {
        exit(0)
    }
    
    @objc private func actionPlayButton() {
        let playVC = PlayViewController()
        navigationController?.pushViewController(playVC, animated: true)
    }
    
    @objc private func actionPolicyButton() {
        let policyVC = PolicyViewController()
        navigationController?.pushViewController(policyVC, animated: true)
    }
}

