//
//  AmortisRow.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 27/03/2024.
//

import SwiftUI

struct AmortisRow: View {
    let index: Int
    let loan: AmortisLoan
    var body: some View {
        GridRow {
            Text(String(index + 1))
            Text(String((loan.start[index] * 100).rounded() / 100))
            Text(String((loan.interests[index] * 100).rounded() / 100))
            Text(String((loan.amortis * 100).rounded() / 100))
            Text(String((loan.annuity[index] * 100).rounded() / 100))
            Text(String((loan.end[index] * 100).rounded() / 100))
        }
    }
}
