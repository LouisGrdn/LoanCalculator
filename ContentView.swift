//
//  ContentView.swift
//  Loan Calculator
//
//  Created by Louis Gardin on 23/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var montant: Float = 0
    @State private var taux: Float = 0
    @State private var duree = 0
    @State private var selectedPeriode: Loan.Periode = .mois
    
    var body: some View {
        ConstantAnnuityForm(montant: $montant, taux: $taux, duree: $duree, selectedPeriode: $selectedPeriode)
    }
}

#Preview {
    ContentView()
}
