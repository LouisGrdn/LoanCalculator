//
//  Loan.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 23/03/2024.
//

import Foundation

class AnnuityLoan: Loan {
    
    override init(amount: Float, rate: Float, time: Int, periode: Loan.Periode) {
        super.init(amount: amount, rate: rate, time: time, periode: periode)
        self.annuity = self.amount * (self.rate / (1 - pow(1 + self.rate, Float(self.time * -1))))
        for i in 0..<self.time {
            i == 0 ? start.append(self.amount) : start.append(end[i - 1])
            interests.append(start[i] * self.rate)
            amortis.append(self.annuity - interests[i])
            end.append(start[i] - amortis[i])
        }
    }
    
    var start: Array<Float> = []
    var end: Array<Float> = []
    var annuity: Float = 0
    var interests: Array<Float> = []
    var amortis: Array<Float> = []
}
