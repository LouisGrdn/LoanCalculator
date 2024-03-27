//
//  PaginationView.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 27/03/2024.
//

import SwiftUI

struct PaginationView: View {
    let loan: Loan
    let rowsPerPage: Int
    @Binding var currentPage: Int
    var body: some View {
        HStack {
            Spacer()
            Button("Précédent") {
                if currentPage > 0 {
                    currentPage -= 1
                }
            }
            .disabled(currentPage == 0)
            Spacer()
            Button("Suivant") {
                if(currentPage < loan.time / rowsPerPage) {
                    currentPage += 1
                }
            }
            .disabled(currentPage >= loan.time / rowsPerPage - 1)
            Spacer()
        }
    }
}

//#Preview {
//    PaginationView()
//}
