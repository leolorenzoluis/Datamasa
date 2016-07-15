module ElementarySchool.View exposing (view)

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
                , th [] [ text "School"]
                , th [] [ text "Grade 1 Male"]
                , th [] [ text "Grade 1 Female"]
                , th [] [ text "Grade 2 Male"]
                , th [] [ text "Grade 2 Female"]
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
          , td [] [ text school.school ]
          , td [] [ text (toString school.gradeOneMaleCount) ]
          , td [] [ text (toString school.gradeOneFemaleCount) ]
          , td [] [ text (toString school.gradeTwoMaleCount) ]
          , td [] [ text (toString school.gradeTwoFemaleCount) ]
          ]
