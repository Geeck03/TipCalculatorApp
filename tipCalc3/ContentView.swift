/*
 
 
 Tip Calculator app
 
 */

import SwiftUI



extension View{
    func fancyTextStyle() -> some View {
        self.modifier(FancyTextMod())
    }
}

struct FancyTextMod: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Avenir", size: 20))
            .fontWeight(.semibold)
            .padding(3.5)
        
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 5)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)

                    .stroke(Color.black, lineWidth: 1)
                )
    }
}




struct ContentView: View {
    @State private var billAmount : Double = 0.0
    @State private var tipPercentage : Double = 0.0
    @State private var numberofPeople : Double = 1.0
    @State private var showResults = false
    @State private var calcResults = "show results"
    
    
    
    var tipAmount : Double {
        
        if tipPercentage == 0 { return 0 }
        
        return (billAmount * tipPercentage / 100.0)
    }
    
    var billAndTip : Double {
        return (billAmount + tipAmount)
    }
    
    var amountPerPerson : Double {
        return billAndTip / numberofPeople
    }
    
    var body: some View {
        
        Text("Tip Calculator")
            .fontWeight(.semibold)
            .font(.largeTitle)
            .kerning(4.5)
            .cornerRadius(10)
            .shadow(radius: 20)
            .padding(6)
        
        VStack {
            Image(systemName: "creditcard")
                .resizable()
                .scaledToFit()
                .imageScale(.large)
                .accentColor(.mint)
                .foregroundStyle(.tint)
                .scaledToFit()
                .frame(width: 130, height: 100)
                .padding(10)
                .frame(width: 400, height: 90)
                .padding(30)
            
            
            Text("Bill amount: $\(String(format: "%.2f", billAmount))")
                .fancyTextStyle()
            
            Slider(value: $billAmount, in: 0...500, step: 1)
                .accentColor(.pink)
                .padding()
                .shadow(radius: 15)
            
            Text("Tip Percentage %\(String(format: "%.0f", tipPercentage))")
                .fancyTextStyle()
            //.padding(10)
            Slider(value: $tipPercentage, in: 0...30, step: 1)
                .accentColor(.cyan)
                .padding()
                .shadow(radius: 15)
            
            Text("Number of People: \(String(format: "%.0f", numberofPeople))")
                .fancyTextStyle()
            
            Slider(value: $numberofPeople, in: 1...20, step: 1)
                .accentColor(.indigo)
                .padding()
                .shadow(radius: 15)
        }
        
        Spacer()
        
        VStack {
            Button (action: { showResults.toggle()
            }){
                Text(showResults ? "Hide Results" : "Calculate")
                    .padding()
                    .tint(.green)
                    .background(Color.black)
                
            }
            .font(.system(size: 20))
            .foregroundColor(.white)
            
        }
        
        .frame(width:500, height:65)
        //.padding(.vertical, )
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
        
        
        
        
        if showResults {
            
            Text("Tip Amount: $\(String(format: "%.2f", tipAmount))")
                .fancyTextStyle()
            Text("Total Amount: \(billAndTip, format: .currency(code: "USD"))")
                .fancyTextStyle()
            Text("Amount per person: \(amountPerPerson, format: .currency(code: "USD"))")
                .fancyTextStyle()
            
        }
    }
}

#Preview {
    ContentView()
}


