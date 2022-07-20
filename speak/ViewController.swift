//
//  ViewController.swift
//  speak
//
//  Created by 林辰澤 on 2022/7/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var loveTextField: UITextField!
    
    @IBOutlet weak var rateSlider: UISlider!
    
    @IBOutlet weak var pitchMultiplierSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func speak(_ sender: Any) {
        print(loveTextField.text!)
        
        let speechUtterance =  AVSpeechUtterance(string: loveTextField.text!)
        //設定語言voice為中文代碼
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        //語速rate 0~1
        speechUtterance.rate = rateSlider.value
        //音調pitchMultiplier 0.5~2
        speechUtterance.pitchMultiplier = pitchMultiplierSlider.value
        //音量volume 0~1
        speechUtterance.volume = 1
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
    
    @IBAction func defaultSpeak(_ sender: Any) {
        print("如果海浪是大海的事，那麼想你就是我的事。")
        
        let speechUtterance =  AVSpeechUtterance(string: "如果海浪是大海的事，那麼想你就是我的事。")
        //設定語言voice為中文代碼
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        //語速rate 0~1
        speechUtterance.rate = 0.4
        //音調pitchMultiplier 0.5~2
        speechUtterance.pitchMultiplier = 0.9
        //音量volume 0~1
        speechUtterance.volume = 1
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
}

extension ViewController: UITextFieldDelegate {
    
//    按下return收起鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       self.view.endEditing(true)
       return true
    }
}
