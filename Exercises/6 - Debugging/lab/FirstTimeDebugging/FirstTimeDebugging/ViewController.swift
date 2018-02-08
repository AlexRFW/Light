import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed.")
    }
    
    override func viewDidLoad() {
        
        myButton.setTitleColor(.green, for: .normal)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sample = "sample"
        print(sample)
        
        if true {
            print("Will this line of code ever be reached?")
            someMethod()
        }
        
        
    }
    
    func someMethod() {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

