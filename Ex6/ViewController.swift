//
//  ViewController.swift
//  Ex6
//
//  Created by 安井基哲 on 2021/09/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var randomNumberLabel: UILabel!

    @IBOutlet private weak var minLabel: UILabel!
    @IBOutlet private weak var maxLabel: UILabel!

    // 乱数の変数（ラベルをデータの置き場にしない）
    private var randomNumber: Int = 0

    @IBOutlet private weak var numberSlider: UISlider!

    private static let valueRange = 1...100

    // 画面が開いたときも乱数を発生させる
    override func viewDidLoad() {
        super.viewDidLoad()

        numberSlider.minimumValue = Float(Self.valueRange.lowerBound)
        numberSlider.maximumValue = Float(Self.valueRange.upperBound)

        minLabel.text = String(Self.valueRange.lowerBound)
        maxLabel.text = String(Self.valueRange.upperBound)

        resetGame()
    }

    @IBAction func judgeButton(_ sender: Any) {

        // スライダーの値を取得
        let valueSlider = Int(numberSlider.value)

        // スライダーとラベルの値を比較し、アラートに送る。
        if valueSlider == randomNumber {
            showAlert(result: "あたり！", value: valueSlider)
        } else {
            showAlert(result: "はずれ！", value: valueSlider)
        }
    }

    private func showAlert(result: String, value: Int) {

        let message = "\(result)\nあなたの値： \(value)"

        let alert = UIAlertController(
            title: "結果",
            message: message,
            preferredStyle: .alert
        )

        // 再挑戦ボタンを押下したら乱数を発生させる
        let retryAlert = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: { [weak self] _ in self?.resetGame() }
        )
        alert.addAction(retryAlert)
        present(alert, animated: true, completion: nil)
    }

    // 乱数を発生させ、ラベルに表示させるメソッド
    private func resetGame() {
        randomNumber = Int.random(in: Self.valueRange)
        randomNumberLabel.text = String(randomNumber)
    }
}
