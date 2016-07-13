module ElementarySchool.Update exposing (..)

import ElementarySchool.Messages exposing (Msg(..))
import ElementarySchool.Models exposing (School)


update : Msg -> List School -> ( List School, Cmd Msg )
update message schools =
    case message of
        NoOp ->
            ( schools, Cmd.none )
