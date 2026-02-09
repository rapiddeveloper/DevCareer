//
//  TimerModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/9/26.
//

import SwiftUI

@Observable
final class TimerModel {
    private(set) var hoursElapsed = 0
    private var timer: Timer?

    func start() {
        stop()

        timer = Timer.scheduledTimer(
            withTimeInterval:  3600,
            repeats: true
        ) { [weak self] _ in
            self?.hoursElapsed += 1
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }

    func reset() {
        stop()
        hoursElapsed = 0
    }
}
