//
//  ViewController.swift
//  利用 CAEmitterLayer 製作 Xmas 的下雪動畫
//
//  Created by  謝皓昀 on 2020/12/11.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let player = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileUrl = Bundle.main.url(forResource: "music", withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 224/255, alpha: 1)
        let balloonEmitterCell = CAEmitterCell()
        balloonEmitterCell.contents = UIImage(named: "balloon")?.cgImage
        balloonEmitterCell.birthRate = 1 //粒子創建速度每秒1個
        balloonEmitterCell.lifetime = 60 //粒子存活時間60秒
        balloonEmitterCell.scale = 1.5
        balloonEmitterCell.scaleRange = 0.5 //粒子大小的範圍 正負0.5
        balloonEmitterCell.yAcceleration = 7 //Ｙ軸的重力
        balloonEmitterCell.scaleSpeed = 0.02 //粒子大小改變的速度
        //balloonEmitterCell.redRange = 1.5
        //balloonEmitterCell.spin = 0.05
        //balloonEmitterCell.spinRange = 1
        balloonEmitterCell.velocity = 100
        
        let anotherBalloonEmitterCell = CAEmitterCell()
        anotherBalloonEmitterCell.contents = UIImage(named: "balloon2")?.cgImage
        anotherBalloonEmitterCell.birthRate = 0.2
        anotherBalloonEmitterCell.lifetime = 20
        anotherBalloonEmitterCell.scale = 1.2
        anotherBalloonEmitterCell.yAcceleration = 4
        anotherBalloonEmitterCell.velocity = 80
        
        let balloonEmitterLayer = CAEmitterLayer()
        balloonEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        balloonEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 50)
        balloonEmitterLayer.emitterShape = .line
        balloonEmitterLayer.emitterCells = [balloonEmitterCell]
        view.layer.addSublayer(balloonEmitterLayer)
        
        let anotherBalloonEmitterLayer = CAEmitterLayer()
        anotherBalloonEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 1)
        anotherBalloonEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 50)
        anotherBalloonEmitterLayer.emitterShape = .line
        anotherBalloonEmitterLayer.emitterCells = [anotherBalloonEmitterCell]
        view.layer.addSublayer(anotherBalloonEmitterLayer)
        // Do any additional setup after loading the view.
    }


}

