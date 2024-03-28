//
//  AmortisTotalRow.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 28/03/2024.
//

import SwiftUI

struct AmortisTotalRow: View {
    let loan: AmortisLoan
    var body: some View {
        let sum = loan.sum()
        GridRow {
            Text("Total")
            Text("")
            Text(String(sum[0].rounded()))
            Text(String(sum[1].rounded()))
            Text(String(sum[2].rounded()))
            Text("")
        }
    }
}
