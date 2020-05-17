

class Dictionary {
    var words : [(String, String)] =
        [   
            ("CLOUD", "It's in the sky"),
            ("AI", "Fake intellect"),
            ("JAVA", "Coffee name"),
            ("JAVASCRIPT", "Make web pages interactive"),
            ("CSS", "Design web pages"),
            ("HTML", "Build web pages"),
            ("CSHARP", "C#"),
            ("PYTHON", "Language named after Comedy group"),
            ("PHP", "Scripting language"),
            ("RUBY", "Same name as a stone"),
            ("IOS", "Apple owns it"),
            ("SWIFT" , "IOS Language"),
            ("ABAP", "Used for SAP applications"),
            ("AWS", "Amazon owns it"),
            ("BASH", "Unix shell and command language"),
            ("COBOL", "Common business-oriented language"),
            ("CURL", "Used for testing PHP services"),
            ("FORTRAN", "Formula Translation"),
            ("GO", "Developed by Google"),
            ("JSON", "File format"),
            ("LINQ", "Data querying capabilities to .NET"),
            ("LISP", "Fully Paranthesized Prefix Notation"),
            ("MATLAB" , "Developed by MathWorks"),
            ("OOPS", "Class, Inheritance concepts"),
            ("OCTAVE", "Part of GNU Project"),
            ("PEARL", "Process and Experiment Automation Realtime Language"),
            ("RPG", "Used in IBM i-series"),
            ("SQL", "Manage the data")
    ]
    var recentlyUsed : [(String, String)] = []
    func getWord(letter: Character, orientation: Bool, X: Int, Y: Int) -> (String, String){
        return words[0]
    }
    func firstWord() -> (String, String){
        words.shuffle()
        return words[Int.random(in: 0..<words.count)]
    }
    func getWordFromDict(intersectLetter: Character, intersectX: Int, intersectY: Int, orientation: Bool) -> ((String, String)?, [String])?{
        if recentlyUsed.count > 4 {
            words.append(recentlyUsed[0])
            recentlyUsed.remove(at: 0)
        }
        for current in words{
            if current.0.contains(intersectLetter){
                let index = words.index {
                    $0 == current.0 && $1 == current.1
                }
                //let cut = current.0.components(separatedBy: String(intersectLetter))
                let cut = splitWord(word: current.0, splitLetter: intersectLetter)
                if cut.count == 1 {
                    let singleCut = cut[0]
                    if intersectLetter == singleCut[singleCut.index(singleCut.startIndex, offsetBy: 0)] {
                        
                    }
                }
                if orientation { // -
                    if intersectY - cut[0].count >= 0 && 8 - cut[1].count > intersectY {
                        words.remove(at: index!)
                        recentlyUsed.append(current)
                        return (current, cut)
                    }
                }
                else {
                    if intersectX - cut[0].count >= 1 && 9 - cut[1].count > intersectX {
                        words.remove(at: index!)
                        recentlyUsed.append(current)
                        return (current, cut)
                    }
                }
            }
        }
        return nil
    }
    func splitWord(word: String, splitLetter: Character) -> [String]{
        var result: [String] = ["" , ""]
        var flip : Bool = true
        for i in word {
            if i == splitLetter && flip{
                flip = !flip
                continue
            }
            if flip {
                result[0].append(i)
            }
            else {
                result[1].append(i)
            }
        }
        return result
    }
}
