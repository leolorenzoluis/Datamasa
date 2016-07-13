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


apply : Decode.Decoder (a -> b) -> Decode.Decoder a -> Decode.Decoder b
apply func value =
    Decode.object2 (<|) func value

memberDecoder : Decode.Decoder School
memberDecoder =
    Decode.map School
      ("schoolId" := Decode.int)
      `apply`("region" := Decode.string)
      `apply`("province" := Decode.string)
      `apply`("municipality" := Decode.string)
      `apply`("division" := Decode.string)
      `apply`("school" := Decode.string)
      `apply`("gradeOneMaleCount" := Decode.int)
      `apply`("gradeOneFemaleCount" := Decode.int)
      `apply`("gradeTwoMaleCount" := Decode.int)
      `apply`("gradeTwoFemaleCount" := Decode.int)
      `apply`("gradeThreeMaleCount" := Decode.int)
      `apply`("gradeThreeFemaleCount" := Decode.int)
      `apply`("gradeFourMaleCount" := Decode.int)
      `apply`("gradeFourFemaleCount" := Decode.int)
      `apply`("gradeFiveMaleCount" := Decode.int)
      `apply`("gradeFiveFemaleCount" := Decode.int)
      `apply`("gradeSixMaleCount" := Decode.int)
      `apply`("gradeSixFemaleCount" := Decode.int)
