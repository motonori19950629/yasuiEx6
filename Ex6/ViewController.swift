//
//  ViewController.swift
//  Ex6
//
//  Created by 安井基哲 on 2021/09/06.
//

import UIKit

class ViewController: UIViewController {
    // 乱数表示ラベル
    @IBOutlet private weak var randomNumberLabel: UILabel!
    // 乱数の変数（ラベルをデータの置き場にしない）
    private var randomNumber: Int = 0
    // スライダー
    @IBOutlet private weak var numberSlider: UISlider!

    // 画面が開いたときも乱数を発生させる
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getRandomNumber()
    }

    // 判定！ボタン
    @IBAction func judgeButton(_ sender: Any) {

        // スライダーの値を取得
        let valueSlider = Int(self.numberSlider.value)

        // スライダーとラベルの値を比較し、アラートに送る。
        if valueSlider == self.randomNumber {
            self.showAlert(result: "あたり！", value: valueSlider)
            return
        } else {
            self.showAlert(result: "はずれ！", value: valueSlider)
            return
        }
    }

    // アラートを表示させるメソッド
    private func showAlert(result: String, value: Int) {

        let message = result + "\nあなたの値： \(value)"
        let alert = UIAlertController(
            title: "結果",
            message: message,
            preferredStyle: .alert
        )

        // 再挑戦ボタンを押下したら乱数を発生させる
        let retryAlert = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: {_ in self.getRandomNumber()}
        )
        alert.addAction(retryAlert)
        present(alert, animated: true, completion: nil)
    }

    // 乱数を発生させ、ラベルに表示させるメソッド
    private func getRandomNumber() {
        self.randomNumber = Int(arc4random_uniform(100))
        self.randomNumberLabel.text = String(self.randomNumber)
    }
}
