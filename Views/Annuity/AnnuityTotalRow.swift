//
//  AnnuityTotalRow.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 28/03/2024.
//

import SwiftUI

struct AnnuityTotalRow: View {
    let loan: AnnuityLoan
    var body: some View {
        let sum = loan.sum()
        GridRow {
            Text("")
            Text("")
            Text(String((sum[0] * 100).rounded() / 100))
            Text(String((sum[1] * 100).rounded() / 100))
            Text(String((sum[2] * 100).rounded() / 100))
            Text("")
        }
    }
}