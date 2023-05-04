
import UIKit

class RulesViewController: UIViewController {

    private let rulesLabelImageView = UIImageView()
    private let rulesLabel = UILabel()
    private let closeButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        setupNextButton()
        
        navigationItem.hidesBackButton = true
        view.layer.contents = UIImage(imageLiteralResourceName: "BackgroundView").cgImage
    }
    
    func setupImageView() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "RULES"
        rulesLabel.font = UIFont(name: "IrishGrover-Regular", size: 40)
        rulesLabel.textAlignment = .center
        rulesLabel.textColor = .white
        
        [rulesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
         rulesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
         rulesLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)].forEach{ $0.isActive = true }
        
        view.addSubview(rulesLabelImageView)
        rulesLabelImageView.translatesAutoresizingMaskIntoConstraints = false
        rulesLabelImageView.image = UIImage(named: "rulesTextMain")
        
        [rulesLabelImageView.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 30),
         rulesLabelImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
         rulesLabelImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)].forEach{ $0.isActive = true }
    }
    
    private func setupNextButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(named: "button"), for: .normal)
        closeButton.setTitle("CLOSE", for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "IrishGrover-Regular", size: 26)
        closeButton.addTarget(self, action: #selector(actionCloseButton), for: .touchUpInside)

        [closeButton.topAnchor.constraint(equalTo: rulesLabelImageView.bottomAnchor,constant: 30),
         closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
         closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80)].forEach{ $0.isActive = true }
    }
    @objc private func actionCloseButton() {
        navigationController?.popViewController(animated: true)
    }
}
