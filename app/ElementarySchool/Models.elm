module ElementarySchool.Models exposing (..)

type alias School =
  { schoolId : Int
  , region : String
  , province : String
  , municipality : String
  , division : String
  , school : String
  , gradeOneMaleCount : Int
  , gradeOneFemaleCount : Int
  , gradeTwoMaleCount : Int
  , gradeTwoFemaleCount : Int
  , gradeThreeMaleCount : Int
  , gradeThreeFemaleCount : Int
  , gradeFourMaleCount : Int
  , gradeFourFemaleCount : Int
  , gradeFiveMaleCount : Int
  , gradeFiveFemaleCount : Int
  , gradeSixMaleCount : Int
  , gradeSixFemaleCount : Int
  }
