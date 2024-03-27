//
//  AmortisLoan.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 26/03/2024.
//

import Foundation

class AmortisLoan: Loan {
    
    override init(amount: Float, rate: Float, time: Int, periode: Loan.Periode) {
        super.init(amount: amount, rate: rate, time: time, periode: periode)
        self.amortis = self.amount / Float(self.time)
        for i in 0..<self.time {
            i == 0 ? start.append(self.amount) : start.append(end[i - 1])
            interests.append(start[i] * self.rate)
            end.append(start[i] - amortis)
            annuity.append(interests[i] + amortis)
        }
    }
    
    var start: Array<Float> = []
    var end: Array<Float> = []
    var annuity: Array<Float> = []
    var interests: Array<Float> = []
    var amortis: Float = 0
    
}
