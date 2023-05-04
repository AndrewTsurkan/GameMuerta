
import UIKit

class PlayTwoViewController: UIViewController{
    private let oneButton = UIButton()
    private let twoButton = UIButton()
    private let threeButton = UIButton()
    private let fourButton = UIButton()
    private let fiveButton = UIButton()
    private let sixButton = UIButton()
    private let sevenButton = UIButton()
    private let eightButton = UIButton()
    private let nineButton = UIButton()
    private let tanButton = UIButton()
    private let elevenButton = UIButton()
    private let twelveButton = UIButton()
    private let threeteenButton = UIButton()
    private let fourteenButton = UIButton()
    private let fivteennButton = UIButton()
    private let sixteenButton = UIButton()
    private let sevebteenButton = UIButton()
    private let eighteenButton = UIButton()
    private let ninateenButton = UIButton()
    private let twentyButton = UIButton()
    
    private let panelImageView = UIImageView()
    private let stackView = UIStackView()
    private let closeButton = UIButton()
    private let stackOneRow = UIStackView()
    private let stackViewTwoRow = UIStackView()
    private let stackViewThreeRow = UIStackView()
    private var counter: Int = 0
    private let labelStackView = UIStackView()
    private let scoreLabel = UILabel()
    private let levelLabel = UILabel()
    private let emptyView = UIView()
    private let fourRowStackView = UIStackView()
    
    var text: String = "0"
    private var score: String = "0"
    private var buttonsAndImagesDict: [Int: String] = [:]
    private var firstSelectedImageIndex: Int?
    private var firstSelectedImageString: String?
    private let horizontalStackView = UIStackView()
    private let images: [String] = ["11","12","13","14","15","16","17","18","19","110"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableImageView()
        setupStackView()
        setupCloseButton()
        setupLableSV()
        fill()
        
        
        navigationItem.hidesBackButton = true
        view.layer.contents = UIImage(imageLiteralResourceName: "backgroundPlay").cgImage
    }
    
    private func setupLableSV() {
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.distribution = .fill
                
        labelStackView.addArrangedSubview(scoreLabel)
        scoreLabel.text = "SCORE:\(score)"
        scoreLabel.font = UIFont(name: "IrishGrover-Regular", size: 26)
        scoreLabel.textColor = .white

        
        labelStackView.addArrangedSubview(emptyView)
        
        labelStackView.addArrangedSubview(levelLabel)
        levelLabel.text = "LEVEL:\(text)"
        levelLabel.font = UIFont(name: "IrishGrover-Regular", size: 26)
        levelLabel.textColor = .white
        
        [labelStackView.bottomAnchor.constraint(equalTo: panelImageView.topAnchor, constant: -10),
         labelStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
         labelStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45)].forEach{ $0.isActive = true }
    }
    
    private func setupTableImageView() {
        view.addSubview(panelImageView)
        panelImageView.translatesAutoresizingMaskIntoConstraints = false
        panelImageView.image = UIImage(named: "backBack")
        
        [panelImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
         panelImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
         panelImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
         panelImageView.heightAnchor.constraint(equalToConstant: 350)].forEach{ $0.isActive = true }
    }
    
    private func setupStackView(){
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        let stackViewSwitch = [stackOneRow, stackViewTwoRow,stackViewThreeRow, fourRowStackView]
        for i in stackViewSwitch {
            stackView.addArrangedSubview(i)
            i.axis = .vertical
            i.distribution = .fillEqually
        }
        
        let oneGroup = [oneButton,twoButton,threeButton,fourButton,fiveButton]
        for i in oneGroup {
            stackOneRow.addArrangedSubview(i)
            i.addTarget(self, action: #selector(onTap), for: .touchUpInside)
            
        }
        
        let twoGroup = [sixButton,sevenButton,eightButton,nineButton,tanButton]
        for i in twoGroup {
            stackViewTwoRow.addArrangedSubview(i)
            i.addTarget(self, action: #selector(onTap), for: .touchUpInside)
            
        }
        
        let threeGroup = [elevenButton,twelveButton,threeteenButton,fourteenButton,fivteennButton]
        for i in threeGroup {
            stackViewThreeRow.addArrangedSubview(i)
            i.addTarget(self, action: #selector(onTap), for: .touchUpInside)
            
        }
        let fourGroup = [sixteenButton,sevebteenButton, eighteenButton, ninateenButton,twentyButton]
        for i in fourGroup {
            fourRowStackView.addArrangedSubview(i)
            i.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        }
        
        [stackView.topAnchor.constraint(equalTo: panelImageView.topAnchor),
         stackView.bottomAnchor.constraint(equalTo: panelImageView.bottomAnchor,constant: -10),
         stackView.leftAnchor.constraint(equalTo: panelImageView.leftAnchor),
         stackView.rightAnchor.constraint(equalTo: panelImageView.rightAnchor)].forEach{ $0.isActive = true }
        
        let group = [oneButton, twoButton, threeButton,fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, tanButton, elevenButton, twelveButton,threeteenButton, fourteenButton,fivteennButton,sixteenButton,sevebteenButton,eighteenButton,ninateenButton,twentyButton]
        group.forEach({$0.setImage(UIImage(named: "empty"), for: .normal)})
        for button in group {
            button.tag = counter
            counter += 1
        }
    }
    
    private func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(named: "button"), for: .normal)
        closeButton.setTitle("CLOSE", for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "IrishGrover-Regular", size: 26)
        closeButton.addTarget(self, action: #selector(actionCloseButton), for: .touchDown)
        
        [closeButton.topAnchor.constraint(equalTo: panelImageView.bottomAnchor, constant: 30),
         closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70)].forEach{ $0.isActive = true }
    }
    
    @objc private func actionCloseButton() {
        navigationController?.popViewController(animated: true)
    }
    
    private func fill() {
        var doubledImages = images + images
        doubledImages = doubledImages.shuffled()
        print(doubledImages)
        for i in 0..<doubledImages.count {
            buttonsAndImagesDict[i] = doubledImages[i]
        }
    }
    
    @objc private func onTap(sender: UIButton) {
        guard firstSelectedImageIndex != sender.tag else { return }
        guard let selectedImage = buttonsAndImagesDict[sender.tag] else { return }
        if let firstSelectedImageString {
            if firstSelectedImageString == selectedImage {
                sender.setImage(UIImage(named: selectedImage), for: .normal)
                score = String(Int(score)! + 100)
                scoreLabel.text = "SCORE:\(score)"
                sender.isEnabled = false
                let group = [self.oneButton, self.twoButton, self.threeButton,self.fourButton, self.fiveButton, self.sixButton, self.sevenButton, self.eightButton, self.nineButton, self.tanButton, self.elevenButton, self.twelveButton, self.threeteenButton,self.fourteenButton,self.fivteennButton,self.sixteenButton,self.sevebteenButton,self.eighteenButton,self.ninateenButton,self.twentyButton]
                group.first(where: {$0.tag == self.firstSelectedImageIndex})?.isEnabled = false
                if score == "1000"{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6)  {
                        let lvlVC = SelectLevelViewController()
                        self.navigationController?.pushViewController(lvlVC, animated: true)
                    }
                }
            }else if firstSelectedImageString != selectedImage{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)  {
                    let group = [self.oneButton, self.twoButton, self.threeButton,self.fourButton, self.fiveButton, self.sixButton, self.sevenButton, self.eightButton, self.nineButton, self.tanButton, self.elevenButton, self.twelveButton, self.threeteenButton,self.fourteenButton,self.fivteennButton,self.sixteenButton,self.sevebteenButton,self.eighteenButton,self.ninateenButton,self.twentyButton]
                    group.first(where: {$0.tag == self.firstSelectedImageIndex})?.setImage(UIImage(named: "empty"), for: .normal)
                    sender.setImage(UIImage(named: "empty"), for: .normal)
                }
            }
            self.firstSelectedImageString = nil
            sender.setImage(UIImage(named: selectedImage), for: .normal)
            
        }else{
            sender.setImage(UIImage(named: selectedImage), for: .normal)
            firstSelectedImageIndex = sender.tag
            firstSelectedImageString = selectedImage
        }
    }
}

