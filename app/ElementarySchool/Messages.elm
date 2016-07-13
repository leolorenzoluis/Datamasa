module ElementarySchool.Messages exposing (..)

import Http
import ElementarySchool.Models exposing (School)

type Msg
  = FetchAllDone (List School)
  | FetchAllFail Http.Error
