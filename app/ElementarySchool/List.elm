module ElementarySchool.List exposing (..)

import Html exposing (..)
import ElementarySchool.Messages exposing (..)
import ElementarySchool.Models exposing (School)

view : List School -> Html Msg
view schools =
    div []
      [ nav schools
      , list schools
      ]

nav : List School -> Html Msg
nav schools =
    h2 [] [ text "Schools " ]

list : List School -> Html Msg
list schools =
    div []
      [ table []
        [ thead []
            [ tr []
                [ th [] [ text "School Id"]
                , th [] [ text "Division"]
                , th [] [ text "Region"]
                , th [] [ text "Municipality"]
                , th [] [ text "Province"]
                ]
            ]
          , tbody [] (List.map schoolRow schools)
          ]
      ]

schoolRow : School -> Html Msg
schoolRow school =
      tr []
          [ td [] [ text (toString school.schoolId) ]
          , td [] [ text school.division ]
          , td [] [ text school.region ]
          , td [] [ text school.municipality ]
          , td [] [ text school.province ]
          , td []
            []
          ]
