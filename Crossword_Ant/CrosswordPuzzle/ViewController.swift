

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    //MARK: Button variables
    @IBOutlet var button0A: CustomButton!
    @IBOutlet var button0B: CustomButton!
    @IBOutlet var button0C: CustomButton!
    @IBOutlet var button0D: CustomButton!
    @IBOutlet var button0E: CustomButton!
    @IBOutlet var button0F: CustomButton!
    @IBOutlet var button0G: CustomButton!
    @IBOutlet var button0H: CustomButton!
    @IBOutlet var button0I: CustomButton!
    
    @IBOutlet var button1A: CustomButton!
    @IBOutlet var button1B: CustomButton!
    @IBOutlet var button1C: CustomButton!
    @IBOutlet var button1D: CustomButton!
    @IBOutlet var button1E: CustomButton!
    @IBOutlet var button1F: CustomButton!
    @IBOutlet var button1G: CustomButton!
    @IBOutlet var button1H: CustomButton!
    @IBOutlet var button1I: CustomButton!
    
    @IBOutlet var button2A: CustomButton!
    @IBOutlet var button2B: CustomButton!
    @IBOutlet var button2C: CustomButton!
    @IBOutlet var button2D: CustomButton!
    @IBOutlet var button2E: CustomButton!
    @IBOutlet var button2F: CustomButton!
    @IBOutlet var button2G: CustomButton!
    @IBOutlet var button2H: CustomButton!
    @IBOutlet var button2I: CustomButton!
    
    @IBOutlet var button3A: CustomButton!
    @IBOutlet var button3B: CustomButton!
    @IBOutlet var button3C: CustomButton!
    @IBOutlet var button3D: CustomButton!
    @IBOutlet var button3E: CustomButton!
    @IBOutlet var button3F: CustomButton!
    @IBOutlet var button3G: CustomButton!
    @IBOutlet var button3H: CustomButton!
    @IBOutlet var button3I: CustomButton!
    
    @IBOutlet var button4A: CustomButton!
    @IBOutlet var button4B: CustomButton!
    @IBOutlet var button4C: CustomButton!
    @IBOutlet var button4D: CustomButton!
    @IBOutlet var button4E: CustomButton!
    @IBOutlet var button4F: CustomButton!
    @IBOutlet var button4G: CustomButton!
    @IBOutlet var button4H: CustomButton!
    @IBOutlet var button4I: CustomButton!
    
    @IBOutlet var button5A: CustomButton!
    @IBOutlet var button5B: CustomButton!
    @IBOutlet var button5C: CustomButton!
    @IBOutlet var button5D: CustomButton!
    @IBOutlet var button5E: CustomButton!
    @IBOutlet var button5F: CustomButton!
    @IBOutlet var button5G: CustomButton!
    @IBOutlet var button5H: CustomButton!
    @IBOutlet var button5I: CustomButton!
    
    @IBOutlet var button6A: CustomButton!
    @IBOutlet var button6B: CustomButton!
    @IBOutlet var button6C: CustomButton!
    @IBOutlet var button6D: CustomButton!
    @IBOutlet var button6E: CustomButton!
    @IBOutlet var button6F: CustomButton!
    @IBOutlet var button6G: CustomButton!
    @IBOutlet var button6H: CustomButton!
    @IBOutlet var button6I: CustomButton!
    
    @IBOutlet var button7A: CustomButton!
    @IBOutlet var button7B: CustomButton!
    @IBOutlet var button7C: CustomButton!
    @IBOutlet var button7D: CustomButton!
    @IBOutlet var button7E: CustomButton!
    @IBOutlet var button7F: CustomButton!
    @IBOutlet var button7G: CustomButton!
    @IBOutlet var button7H: CustomButton!
    @IBOutlet var button7I: CustomButton!
    
    @IBOutlet var button8A: CustomButton!
    @IBOutlet var button8B: CustomButton!
    @IBOutlet var button8C: CustomButton!
    @IBOutlet var button8D: CustomButton!
    @IBOutlet var button8E: CustomButton!
    @IBOutlet var button8F: CustomButton!
    @IBOutlet var button8G: CustomButton!
    @IBOutlet var button8H: CustomButton!
    @IBOutlet var button8I: CustomButton!
    
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var stackHorizontal: UIStackView!
    
    var buttons : [[CustomButton?]] = []
    var grid : [[Character]] = []
    let invisibleTextField = UITextField(frame: CGRect.zero)
    var board : CrosswordGenerator!
    var currentButtonX : Int!
    var currentButtonY : Int!
    var currentWordLength : Int!
    var currentLetterCount : Int!
    var currentWordX: Int?
    var currentWordY: Int?
    var currentOrientation: Bool?
    var currentIntersectX: Int?
    var currentIntersectY: Int?
    var currentIntersectIndex: Int?
    var validIntersection: Bool?
    var error: Bool = false
    var score: Int = 0
    var hud: MBProgressHUD?
    var timer: Timer?
    var seconds: Int = 60
    
    //MARK :- Current Square
    @IBAction func selectSquare(_ sender: CustomButton) {
        if currentOrientation! && sender.Y == currentWordY {
            currentButtonX = sender.X
            currentButtonY = sender.Y
            sender.borderWidth = 2
            sender.borderColor = UIColor.green
            invisibleTextField.becomeFirstResponder()
        }
        else if !currentOrientation! && sender.X == currentWordX {
            currentButtonX = sender.X
            currentButtonY = sender.Y
            sender.borderWidth = 2
            sender.borderColor = UIColor.green
            invisibleTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func textFieldDidChange( sender: UITextField){
        buttons[currentButtonY][currentButtonX]?.setTitle((invisibleTextField.text)?.uppercased(), for: .normal)
        buttons[currentButtonY][currentButtonX]?.borderWidth = 2
        buttons[currentButtonY][currentButtonX]?.borderColor = UIColor.black
        if buttons[currentButtonY][currentButtonX]?.titleLabel?.text == " "{
            currentLetterCount += 1
        }
        else if currentOrientation! {
            if currentButtonX == currentIntersectX! && !validIntersection! {
                currentLetterCount += 1
                validIntersection = true
            }
        }
        else if !currentOrientation! {
            if currentButtonY == currentIntersectY! && !validIntersection! {
                currentLetterCount += 1
                validIntersection = true
            }
        }
        
        grid[currentButtonY][currentButtonX] = Character(invisibleTextField.text!.uppercased())
        invisibleTextField.text = nil
        if currentLetterCount < currentWordLength {
            var canMoveToNext = true
            if currentOrientation! && currentButtonX < 8{
                currentButtonX += 1
                if currentButtonX >= currentWordX! + currentWordLength {
                    canMoveToNext = false
                }
            }
            else if currentButtonY < 8{
                currentButtonY += 1
                if currentButtonY >= currentWordY! + currentWordLength {
                    canMoveToNext = false
                }
            }
            if canMoveToNext {
                selectSquare(buttons[currentButtonY][currentButtonX]!)
            }
        }
        else{
            invisibleTextField.resignFirstResponder()
            checkWord()
        }
    }
    
    
    func startGame(){
        board.startGame()
        hintLabel.text = board.currentWord?.1
        currentWordLength = 0
        currentLetterCount = 1
        currentIntersectX = 0
        currentIntersectY = 0
        currentOrientation = board.currentOrientation
        validIntersection = false
        for y in 0...8{
            for x in 0...8{
                if board.grid[y][x] == " "{
                    buttons[y][x]?.backgroundColor = UIColor.black
                    buttons[y][x]?.isEnabled = false
                }
                else{
                    currentWordLength += 1
                    if currentWordX == nil {
                        currentWordX = x
                        currentWordY = y
                        currentButtonX = x
                        currentButtonY = y
                        grid[currentWordY!][currentWordX!] = board.grid[y][x]
                        buttons[y][x]?.setTitle(String(grid[y][x]), for: .normal)
                    }
                }
            }
        }
    }
    
    func checkWord() {
        if grid.elementsEqual(board.grid, by: ==) {
            let newXY = board.nextBoard()
            currentIntersectX = newXY.3
            currentIntersectY = newXY.4
            currentIntersectIndex = newXY.5
            hintLabel.text = board.currentWord?.1
            currentWordLength = newXY.2.0.count
            currentLetterCount = 0
            currentWordX = newXY.0
            currentWordY = newXY.1
            error = false
            currentOrientation = !currentOrientation!
            validIntersection = false
            
            showHudWithAnswer(isRight: true)
            
            score += 1
            updateScoreLabel()
            
            if(timer == nil) {
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onUpdateTimer), userInfo: nil, repeats: true)
            }
            
            refreshBoard()
            selectSquare(buttons[currentWordY!][currentWordX!]!)
        }
        else {
            for y in 0...8{
                for x in 0...8{
                    if board.grid[y][x] != grid[y][x] {
                        buttons[y][x]?.borderColor = UIColor.red
                        if !error {
                            error = true
                            buttons[y][x]?.pulsate()
                            //self.selectSquare(self.buttons[self.currentButtonY][self.currentButtonX]!)
                            selectSquare(buttons[currentWordY!][currentWordX!]!)
                        }
                    }
                }
            }
        }
    }
    
    func refreshBoard() {
        grid = board.grid
        for y in 0...8{
            for x in 0...8{
                if board.grid[y][x] == " "{
                    buttons[y][x]?.backgroundColor = UIColor.black
                    
                    buttons[y][x]?.setTitle(" ", for: .normal)
                }
                else{
                    buttons[y][x]?.isEnabled = true
                    buttons[y][x]?.backgroundColor = UIColor.white
                    if currentWordX == nil {
                        currentWordX = x
                        currentWordY = y
                    }
                }
                if buttons[y][x]?.currentTitle != String(grid[y][x]) {
                    buttons[y][x]?.setTitle(" ", for: .normal)
                }
            }
        }
        for i in 0..<currentWordLength {
            if currentOrientation! {
                if currentWordX! + i != currentIntersectX {
                    grid[currentWordY!][currentWordX! + i] = " "
                    buttons[currentWordY!][currentWordX! + i]?.setTitle(" ", for: .normal)
                }
            }
            else {
                if currentWordY! + i != currentIntersectY {
                    grid[currentWordY! + i][currentWordX!] = " "
                    buttons[currentWordY! + i][currentWordX!]?.setTitle(" ", for: .normal)
                }
            }
        }
    }
    
    func updateScoreLabel() {
        scoreLabel?.text = "\(score)"
    }
    
    func updateTimeLabel() {
        if(timeLabel != nil) {
            let min: Int = (seconds / 60) % 60
            let sec: Int = seconds % 60
            
            let min_p: String = String(format: "%02d", min)
            let sec_p: String = String(format: "%02d", sec)
            
            timeLabel!.text = "\(min_p):\(sec_p)"
        }
    }
    
    func showHudWithAnswer(isRight: Bool) {
        var imageView: UIImageView?
        
        if isRight {
            imageView = UIImageView(image: UIImage(named: "thumbs-up"))
        }
        else {
            imageView = UIImageView(image: UIImage(named: "thumbs-down"))
        }
        
        if(imageView != nil) {
            hud?.mode = MBProgressHUDMode.customView
            hud?.customView = imageView
            
            hud?.show(animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.hud?.hide(animated: true)
            }
        }
    }
    
    @objc func onUpdateTimer() -> Void {
        if(seconds > 0 && seconds <= 60) {
            seconds -= 1
            updateTimeLabel()
        }
        else if(seconds == 0) {
            if(timer != nil) {
                timer?.invalidate()
                timer = nil
                
                let alertController = UIAlertController(title: "Time Up!", message: "Your time is up! You got a score of: \(score) points", preferredStyle: .alert)
                
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: nil)
                alertController.addAction(restartAction)
                
                self.present(alertController, animated: true, completion: nil)
                
                score = 0
                seconds = 60
                
                updateTimeLabel()
                updateScoreLabel()
                board.startGame()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hud = MBProgressHUD(view: self.view)
        if hud != nil {
            self.view.addSubview(hud!)
        }
        
        self.view.addSubview(invisibleTextField)
        
        updateScoreLabel()
        
        invisibleTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        
        buttons = [
            [button0A, button1A, button2A,button3A,button4A, button5A, button6A, button7A, button8A],
            [button0B, button1B, button2B,button3B,button4B, button5B, button6B, button7B, button8B],
            [button0C, button1C, button2C,button3C,button4C, button5C, button6C, button7C, button8C],
            [button0D, button1D, button2D,button3D,button4D, button5D, button6D, button7D, button8D],
            [button0E, button1E, button2E,button3E,button4E, button5E, button6E, button7E, button8E],
            [button0F, button1F, button2F,button3F,button4F, button5F, button6F, button7F, button8F],
            [button0G, button1G, button2G,button3G,button4G, button5G, button6G, button7G, button8G],
            [button0H, button1H, button2H,button3H,button4H, button5H, button6H, button7H, button8H],
            [button0I, button1I, button2I,button3I,button4I, button5I, button6I, button7I, button8I]
        ]
        grid = [
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        ]
        currentButtonX = 0
        currentButtonY = 0
        
        board = CrosswordGenerator()
        
        view.backgroundColor = UIColor.blue
        
        for i in 0...8{
            for j in 0...8 {
                buttons[i][j]?.setTitle(" ", for: .normal)
                buttons[i][j]?.borderColor = UIColor.black
                buttons[i][j]?.borderWidth = 2
                buttons[i][j]?.X = j
                buttons[i][j]?.Y = i
                
                buttons[i][j]?.backgroundColor = UIColor.white
                buttons[i][j]?.isEnabled = true
            }
        }
        startGame()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.selectSquare(self.buttons[self.currentButtonY][self.currentButtonX]!)
        })
    }
}

