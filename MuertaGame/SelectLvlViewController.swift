
import UIKit

class SelectLevelViewController: UIViewController{
    
    private var stackViewOneRow = UIStackView()
    private var stackViewTwoRow = UIStackView()
    private var stackViewThreeRow = UIStackView()
    private var stackViewAllRow = UIStackView()
    private let selectLvlImageView = UILabel()
    private let lvlOneButton = UIButton()
    private let lvlTwoButton = UIButton()
    private let lvlThreeButton = UIButton()
    private let lvlFourButton = UIButton()
    private let lvlFiveButton = UIButton()
    private let lvlSixButton = UIButton()
    private let lvlSevenButton = UIButton()
    private let lvlEightButton = UIButton()
    private let lvlNineButton = UIButton()
    private let lvlTanButton = UIButton()
    private let bonusLvlButton = UIButton()
    private let emptyView = UIView()
    private let closeButton = UIButton()
    private var counter: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelectImage()
        setupStackView()
        setupButton()
        setupCloseButton()
        
        navigationItem.hidesBackButton = true
        view.layer.contents = UIImage(imageLiteralResourceName: "BackgroundView").cgImage
    }
    
    private func setupSelectImage() {
        view.addSubview(selectLvlImageView)
        selectLvlImageView.translatesAutoresizingMaskIntoConstraints = false
        selectLvlImageView.text = "SELECT LEVEL"
        selectLvlImageView.font = UIFont(name: "IrishGrover-Regular", size: 26)
        selectLvlImageView.textAlignment = .center
        selectLvlImageView.textColor = .white

        [selectLvlImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
         selectLvlImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90),
         selectLvlImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90)].forEach{ $0.isActive = true }
    }
    private func setupStackView() {
        view.addSubview(stackViewAllRow)
        stackViewAllRow.translatesAutoresizingMaskIntoConstraints = false
        stackViewAllRow.axis = .vertical
        stackViewAllRow.spacing = 10
        
        stackViewAllRow.addArrangedSubview(stackViewOneRow)
        stackViewOneRow.axis = .horizontal
        stackViewOneRow.spacing = 5
        
        stackViewAllRow.addArrangedSubview(stackViewTwoRow)
        stackViewTwoRow.axis = .horizontal
        stackViewTwoRow.spacing = 5
        
        stackViewAllRow.addArrangedSubview(stackViewThreeRow)
        stackViewThreeRow.axis = .horizontal
        stackViewThreeRow.spacing = 5

        [stackViewAllRow.topAnchor.constraint(equalTo: selectLvlImageView.bottomAnchor, constant: 30),
         stackViewAllRow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
         stackViewAllRow.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35)].forEach{ $0.isActive = true }
    }
    
    private func setupButton(){
        stackViewOneRow.addArrangedSubview(lvlOneButton)
        lvlOneButton.setTitle("1", for: .normal)

        stackViewOneRow.addArrangedSubview(lvlTwoButton)
        lvlTwoButton.setTitle("2", for: .normal)

        stackViewOneRow.addArrangedSubview(lvlThreeButton)
        lvlThreeButton.setTitle("3", for: .normal)

        stackViewOneRow.addArrangedSubview(lvlFourButton)
        lvlFourButton.setTitle("4", for: .normal)

        
        stackViewTwoRow.addArrangedSubview(lvlFiveButton)
        lvlFiveButton.setTitle("5", for: .normal)

        stackViewTwoRow.addArrangedSubview(lvlSixButton)
        lvlSixButton.setTitle("6", for: .normal)

        stackViewTwoRow.addArrangedSubview(lvlSevenButton)
        lvlSevenButton.setTitle("7", for: .normal)

        stackViewTwoRow.addArrangedSubview(lvlEightButton)
        lvlEightButton.setTitle("8", for: .normal)

        
        stackViewThreeRow.addArrangedSubview(lvlNineButton)
        lvlNineButton.setTitle("9", for: .normal)

        stackViewThreeRow.addArrangedSubview(lvlTanButton)
        lvlTanButton.setTitle("10", for: .normal)

        stackViewThreeRow.addArrangedSubview(bonusLvlButton)
        bonusLvlButton.setTitle("BONUS", for: .normal)
        bonusLvlButton.setBackgroundImage(UIImage(named: "lvlBack"), for: .normal)
        bonusLvlButton.titleLabel?.font = UIFont(name: "IrishGrover-Regular", size: 19)

        stackViewThreeRow.addArrangedSubview(emptyView)
        

        let group = [lvlOneButton,lvlTwoButton,lvlThreeButton,lvlFourButton,lvlFiveButton,lvlSixButton,lvlSevenButton,lvlEightButton,lvlNineButton,lvlTanButton]
        for i in group {
            i.tag = counter
            counter += 1
        }
        group.forEach({$0.setBackgroundImage(UIImage(named: "lvlBack"), for: .normal)})
        group.forEach({$0.titleLabel?.font = UIFont(name: "IrishGrover-Regular", size: 30)})
        
        let button = [lvlOneButton,lvlTwoButton,lvlThreeButton,lvlFourButton]
        button.forEach({$0.addTarget(self, action: #selector(actionButton), for: .touchUpInside)})
        
        let buttonTwo = [lvlFiveButton,lvlSixButton,lvlSevenButton,lvlEightButton,lvlNineButton,lvlTanButton]
        buttonTwo.forEach({$0.addTarget(self, action: #selector(actionTwoLvlButton), for: .touchUpInside)})
        
        bonusLvlButton.addTarget(self, action: #selector(actionBonusLvl), for: .touchUpInside)
    }
    
    private func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(named: "button"), for: .normal)
        closeButton.setTitle("CLOSE", for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "IrishGrover-Regular", size: 26)
        closeButton.addTarget(self, action: #selector(actionCloseButton), for: .touchUpInside)
        
        
        [closeButton.topAnchor.constraint(equalTo: stackViewAllRow.bottomAnchor, constant: 30),
         closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75)].forEach{ $0.isActive = true }
        
    }
    
    @objc func actionButton(_ sender: UIButton) {
        let playVC = PlayViewController()
        navigationController?.pushViewController(playVC, animated: true)
        playVC.text = String(sender.tag)
    }
    
    @objc private func actionCloseButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func actionTwoLvlButton(_ sender: UIButton) {
        let playVC = PlayTwoViewController()
        navigationController?.pushViewController(playVC, animated: true)
        playVC.text = String(sender.tag)

    }
    @objc private func actionBonusLvl() {
        let bonusVC = BonusLevelViewController()
        navigationController?.pushViewController(bonusVC, animated: true)
    }
    
}
