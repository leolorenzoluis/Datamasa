#r "../packages/FSharp.Data/lib/net40/FSharp.Data.dll"
namespace Dataset
    open FSharp.Data
    open System


//Todo: Test comment
    module Elementary =
        type Elementary = {
            SchoolId : int
            Region : string
            Province : string
            Municipality : string
            Division : string
            School : string
            GradeOneMaleCount : int
            GradeOneFemaleCount : int
            GradeTwoMaleCount : int
            GradeTwoFemaleCount : int
            GradeThreeMaleCount : int
            GradeThreeFemaleCount : int
            GradeFourMaleCount : int
            GradeFourFemaleCount : int
            GradeFiveMaleCount : int
            GradeFiveFemaleCount : int
            GradeSixMaleCount : int
            GradeSixFemaleCount : int
          }

        type Provider = CsvProvider<"../data/elementary.csv">
        let providerContext = Provider.Load("../data/elementary.csv")

        let value = providerContext.Rows
                            |> Seq.map (fun row ->
                                                  {
                                                        SchoolId = row.School_id
                                                        Region = row.Region
                                                        Province = row.Province
                                                        Municipality = row.Municipality
                                                        Division = row.Division
                                                        School = row.School_name
                                                        GradeOneMaleCount =  row.Grade_1_male
                                                        GradeOneFemaleCount = row.Grade_1_female
                                                        GradeTwoMaleCount = row.Grade_2_male
                                                        GradeTwoFemaleCount = row.Grade_2_female
                                                        GradeThreeMaleCount = row.Grade_3_male
                                                        GradeThreeFemaleCount = row.Grade_3_female
                                                        GradeFourMaleCount = row.Grade_4_male
                                                        GradeFourFemaleCount = row.Grade_4_female
                                                        GradeFiveMaleCount = row.Grade_5_male
                                                        GradeFiveFemaleCount = row.Grade_5_female
                                                        GradeSixMaleCount = row.Grade_6_male
                                                        GradeSixFemaleCount = row.Grade_6_female
                                                    })
