// An example of the delegate pattern using protocols, delegates and delegators
// Read the accompanying article here:
// https://medium.com/@mrlauriegray/delegates-40920c19d0a6

protocol godFatherContract {
    func willCallThisFunctionLaterSoItBetterBeLegit()
}

class somePoorGuy: godFatherContract {
    func willCallThisFunctionLaterSoItBetterBeLegit() {
        print("Must... go... do... duty... now....")
    }
}



class GodFather {
    var delegate: godFatherContract?
    
    func makeThatCall() {
        delegate?.willCallThisFunctionLaterSoItBetterBeLegit()
    }
}


let poorGuyJimmy = somePoorGuy()
let almightyGodFather = GodFather()
almightyGodFather.delegate = poorGuyJimmy
almightyGodFather.delegate?.willCallThisFunctionLaterSoItBetterBeLegit()