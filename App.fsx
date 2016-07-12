#r "packages/Suave/lib/net40/Suave.dll"
#r "packages/Newtonsoft.Json/lib/net45/Newtonsoft.Json.dll"
#r "packages/FSharp.Data/lib/net40/FSharp.Data.dll"
#load "server/Dataset.fs"

open System
open System.IO
open Suave
open Suave.Filters
open Suave.Operators
open Suave.Web
open Suave.Successful
open Newtonsoft.Json
open Newtonsoft.Json.Serialization
open Dataset



let JSON v =
        let jsonSerializerSettings = new JsonSerializerSettings()
        jsonSerializerSettings.ContractResolver <- new CamelCasePropertyNamesContractResolver()

        JsonConvert.SerializeObject(v, jsonSerializerSettings)
        |> OK
        >=> Writers.setMimeType "application/json; charset=utf-8"

let getAll= warbler (fun _ -> Elementary.value |> JSON)

let indexPath = Path.Combine(__SOURCE_DIRECTORY__, "app/index.html")
let indexFile = File.ReadAllText(indexPath)


let app =  choose
            [ GET >=> choose
                [ path "/elementary" >=> getAll
                  path "/" >=> OK indexFile ; Files.browseHome ]
            ]
