module ElementarySchool.Update exposing (..)

import ElementarySchool.Messages exposing (Msg(..))
import ElementarySchool.Models exposing (School)


update : Msg -> List School -> ( List School, Cmd Msg )
update message schools =
    case message of
        FetchAllDone allSchools ->
          --Debug.log (toString (List.isEmpty allSchools))

            ( allSchools, Cmd.none )
        FetchAllFail error ->
            Debug.log (toString error)
            ( schools, Cmd.none)
