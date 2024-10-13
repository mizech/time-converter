import SwiftUI

struct ContentView: View {
    @State private var selectedInput = TimeUnits.seconds
    @State private var selectedOutput = TimeUnits.seconds
    @State private var inputValue: Double? = nil
    @State private var outputValue = 0.0
    
    func convertInput() {
        outputValue = inputValue ?? 0.0
        
        if var inputValue = inputValue {
            switch selectedInput {
                case .seconds:
                    break
                case .minutes:
                    inputValue *= 60.0
                case .hours:
                    inputValue *= (60.0 * 60.0)
                case .days:
                    inputValue *= (60.0 * 60.0 * 24.0)
            }
            
            switch selectedOutput {
                case .seconds:
                    outputValue = inputValue
                case .minutes:
                    outputValue = inputValue / 60.0
                case .hours:
                    outputValue = inputValue / (60.0 * 60.0)
                case .days:
                    outputValue = inputValue / (60.0 * 60.0 * 24.0)
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Time-Units Converter")
                .font(.title)
            Form {
                Section {
                    TextField(
                        "Value to convert",
                        value: $inputValue,
                        format: .number
                    ).keyboardType(.decimalPad)
                    UnitPickerView(selectedUnit: $selectedInput)
                } header: {
                    Text("Input")
                        .font(.title2)
                }
                Section {
                    UnitPickerView(selectedUnit: $selectedOutput)
                    Text("\(String(format: "%.2f", inputValue ?? 0.0)) \(selectedInput.rawValue) > \(String(format: "%.2f", outputValue)) \(selectedOutput.rawValue)")
                        .font(.title3)
                        .bold()
                } header: {
                    Text("Output")
                        .font(.title2)
                }
            }
        }
        .onChange(of: selectedInput) {
            convertInput()
        }
        .onChange(of: selectedOutput) {
            convertInput()
        }
        .onChange(of: inputValue) {
            convertInput()
        }
    }
}

#Preview {
    ContentView()
}
