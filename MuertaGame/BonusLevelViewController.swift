
import UIKit

class BonusLevelViewController: UIViewController {

    private let bonusLvlText = UIImageView()
    private let bonusImageView = UIImageView()
    private let playButton = UIButton()
    private let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        setupPlayButton()
        setupNextButton()
        
        navigationItem.hidesBackButton = true
        view.layer.contents = UIImage(imageLiteralResourceName: "BackgroundView").cgImage
    }
    
    func setupImageView() {
        view.addSubview(bonusImageView)
        bonusImageView.translatesAutoresizingMaskIntoConstraints = false
        bonusImageView.image = UIImage(named: "bonuslevel")
        
        view.addSubview(bonusLvlText)
        bonusLvlText.translatesAutoresizingMaskIntoConstraints = false
        bonusLvlText.image = UIImage(named: "rulesText")
        
        [bonusImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
         bonusImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)].forEach{ $0.isActive = true }
        
        [bonusLvlText.topAnchor.constraint(equalTo: bonusImageView.bottomAnchor,constant: 30),
         bonusLvlText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
         bonusLvlText.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -25)].forEach{ $0.isActive = true }
    }
    
    private func setupPlayButton() {
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(UIImage(named: "play"), for: .normal)
        
        [playButton.topAnchor.constraint(equalTo: bonusLvlText.bottomAnchor,constant: 30),
         playButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80)].forEach{ $0.isActive = true }
    }
    
    private func setupNextButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(named: "button"), for: .normal)
        closeButton.setTitle("CLOSE", for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "IrishGrover-Regular", size: 26)
        closeButton.addTarget(self, action: #selector(actionCloseButton), for: .touchUpInside)

        [closeButton.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -250),
         closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
         closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80)].forEach{ $0.isActive = true }
    }
    
    @objc private func actionCloseButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
