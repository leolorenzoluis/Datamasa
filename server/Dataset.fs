namespace Dataset
    open FSharp.Data

    module Elementary =
        type Elementary = {
            SchoolId : int
            Region : string
            Province : string
            Municipality : string
            Division : string
            }

        type private Provider = CsvProvider<"data/elementary.csv">
        let private providerContext = Provider.Load("data/elementary.csv")
        let value = providerContext.Rows
                            |> Seq.map (fun row -> {
                                                        Region = row.Region
                                                        Province = row.Province
                                                        Municipality = row.Municipality
                                                        Division = row.Division
                                                        SchoolId = row.School_id
                                                    })
