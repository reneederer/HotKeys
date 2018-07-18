open FSharp.Data
open System.Xml.Linq
open System.Xml
open System.IO
open System
open System.Linq

[<Literal>]
let xmlFile = "c:/users/rene/source/repos/HotKeys/HotKeys/hotkeys.xml"
let ahkFile = Path.ChangeExtension(xmlFile, "ahk")
type HotKeys = XmlProvider<xmlFile>

let rec combinations (items : list<'a>) : list<list<'a>> =
    match items with
    | [] -> [[]]
    | (x::xs) ->
        let cs = combinations xs
        [ for combination in cs do
            yield x::combination
        ] @ cs
    
[<EntryPoint>]
let main argv =
    File.Delete ahkFile
    File.AppendAllText(ahkFile, "#SingleInstance force\r\nsetCapslockState,alwaysOff\r\n\r\ncapslock & escape::\r\n\treload,1000\r\n\tmsgBox,reload\r\n\treturn\r\n\r\n")
    let root = HotKeys.Load(xmlFile)
    let withoutBraces (s : string) =
        if s.Length >= 2 && s.[0] = '{' && s.Last() = '}'
        then s.Substring(1, s.Length-2)
        else s
    
    let defaultModifiers =
        combinations [ "+"; "!"; "#"; "^" ]
    
    let newline = "\r\n"
    let newlineTabbed = "\r\n\t"

    [ for customModifier in root.Remaps.CustomModifiers do
        for customModifierKey in customModifier.Keys do
            let defaultReleaseInput =
                let oDefaultRelease =
                    customModifier.OnReleases
                    |> Array.tryFind
                        (fun onRelease -> onRelease.PressedDefaultModifiers |> Array.isEmpty)
                match oDefaultRelease with
                | None ->
                    newlineTabbed + "return" + newline + newline
                | Some defaultRelease ->
                    defaultRelease.Input
            for defaultModifier in defaultModifiers do
                let oOnRelease =
                    customModifier.OnReleases
                    |> Array.tryFind
                        (fun onRelease ->
                            (onRelease.PressedDefaultModifiers |> Set.ofArray) = (defaultModifier |> Set.ofList)
                            || onRelease.PressedDefaultModifiers |> Array.isEmpty && defaultModifier = [])
                match oOnRelease with
                | Some onRelease ->
                    let pressedDefaultModifierStr = onRelease.PressedDefaultModifiers |> String.Concat
                    if pressedDefaultModifierStr = "!"
                    then
                        ()
                    let cause = pressedDefaultModifierStr + customModifierKey + " up::"
                    let effect =
                        newlineTabbed + "sendInput," + onRelease.Input + newlineTabbed + "return" + newline + newline
                    yield cause + effect
                | None ->
                    let pressedDefaultModifierStr = defaultModifier |> String.Concat
                    let cause = pressedDefaultModifierStr + customModifierKey + " up::"
                    let effect =
                        if customModifierKey.Length = 1
                        then
                            newlineTabbed + "sendInput," + pressedDefaultModifierStr + customModifierKey + newlineTabbed + "return" + newline + newline
                        elif customModifierKey.ToUpper().StartsWith "SC"
                        then
                            newlineTabbed + "sendInput," + pressedDefaultModifierStr + "{" + customModifierKey + "}" + newlineTabbed + "return" + newline + newline
                        else
                            newlineTabbed + "sendInput," + pressedDefaultModifierStr + defaultReleaseInput + newlineTabbed + "return" + newline + newline
                    yield cause + effect
            for onPress in customModifier.OnPresses do
                let cause = customModifierKey + " & " + onPress.Key + "::"
                let effect = newlineTabbed + "sendInput,{blind}" + onPress.Input + newlineTabbed + "return" + newline + newline
                yield cause + effect
    ]
    |> List.iter (fun hotKeyStr ->
        File.AppendAllText(ahkFile, hotKeyStr))
        
    printfn "%Afertig!" argv
    0


            




