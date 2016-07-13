module ElementarySchool.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Task
import ElementarySchool.Models exposing (School)
import ElementarySchool.Messages exposing (..)

fetchAll : Cmd Msg
fetchAll =
    Http.get collectionDecoder fetchAllUrl
      |> Task.perform FetchAllFail FetchAllDone

fetchAllUrl : String
fetchAllUrl =
    "http://localhost:8083/elementary"

collectionDecoder : Decode.Decoder (List School)
collectionDecoder =
    Decode.list memberDecoder

memberDecoder : Decode.Decoder School
memberDecoder =
    Decode.object5 School
      ("schoolId" := Decode.int)
      ("region" := Decode.string)
      ("province" := Decode.string)
      ("municipality" := Decode.string)
      ("division" := Decode.string)
