//
//  LoanTab.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 24/03/2024.
//

import SwiftUI
import Foundation

struct AmortisLoanTab: View {
    let loan: AmortisLoan
    let rowsPerPage: Int
    @State private var currentPage = 0
    var body: some View {
        ScrollView(.horizontal) {
            Grid {
                GridRow {
                    Text("Périodes")
                    Text("Capital")
                    Text("Intérêts")
                    Text("Amortissement")
                    Text("Annuité")
                    Text("Capital")
                }
                Divider()
                ForEach(currentPage * rowsPerPage..<currentPage * rowsPerPage + rowsPerPage, id: \.self) {index in
                    AmortisRow(index: index, loan: loan)
                    Divider()
                }
            }
        }
        .padding(.horizontal, 10)
        if rowsPerPage < loan.time {
            PaginationView(loan: loan, rowsPerPage: rowsPerPage, currentPage: $currentPage)
        }
    }
}

#Preview {
    AmortisLoanTab(loan: (AmortisLoan(amount: 10000, rate: 5, time: 8, periode: AnnuityLoan.Periode.annee)))
}
