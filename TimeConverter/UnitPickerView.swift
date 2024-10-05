import SwiftUI

struct UnitPickerView: View {
    @Binding var selectedUnit: TimeUnits
    
    var body: some View {
        Picker("Please selected the input-unit", selection: $selectedUnit) {
            ForEach(TimeUnits.allCases, id: \.self) { unit in
                Text(unit.rawValue)
            }
        }.pickerStyle(.segmented)
    }
}

#Preview {
    UnitPickerView(selectedUnit: .constant(TimeUnits.days))
}
