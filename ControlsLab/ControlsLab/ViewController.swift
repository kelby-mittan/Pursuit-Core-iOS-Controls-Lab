import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var stepperControl: UIStepper!
    @IBOutlet var cardLabels: [UILabel]!
    
    var suit = "♦️"
    
    var currentSegmentIndex: Int = 0 {
        didSet {
            switch segmentedController.selectedSegmentIndex {
            case 0:
                suit = "♦️"
            case 1:
                suit = "♥️"
            case 2:
                suit = "♣️"
            case 3:
                suit = "♠️"
            default:
                suit = "😬"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.borderWidth = 8
        cardView.layer.borderColor = UIColor.black.cgColor
        configureStepper()
        for cardLabel in cardLabels {
            cardLabel.text = "\(Int(stepperControl.value))" + suit
        }
    }
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        currentSegmentIndex = sender.selectedSegmentIndex
        for cardLabel in cardLabels {
            cardLabel.text = "\(Int(stepperControl.value))" + suit
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        switch sender.value {
        case 11:
            for cardLabel in cardLabels {
                cardLabel.text = "🤹‍♂️" + suit
            }
        case 12:
            for cardLabel in cardLabels {
                cardLabel.text = "👸" + suit
            }
        case 13:
            for cardLabel in cardLabels {
                cardLabel.text = "🤴" + suit
            }
        case 14:
            for cardLabel in cardLabels {
                cardLabel.text = "𝐀" + suit
            }
        default:
            for cardLabel in cardLabels {
                cardLabel.text = "\(Int(sender.value))" + suit
            }
        }
        
    }
    
    func configureStepper() {
        stepperControl.minimumValue = 2
        stepperControl.maximumValue = 14
        stepperControl.stepValue = 1
        stepperControl.value = 2
    }
}

