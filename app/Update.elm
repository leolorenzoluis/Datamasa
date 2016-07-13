module Update exposing (..)

import Models exposing (Model)
import Messages exposing (Msg (NoOp, WidgetMsg))
import Elementary.Widget

-- this is our "root" update, which is called many times
-- throughout the lifecycle of the application,
-- any time it receives a new Msg.
-- when we receive a new Msg,
-- we can decide how it affects the Model (app state),
-- as well as which commands we might want to dispatch.
-- notice that we must return a tuple of the new model and the command together!
-- this is because elm, like pretty much all languages, can only return one value
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    -- since Msg is a union type, we need to handle
    -- every single case in a case..of statement
    case msg of
        -- "no operation", so return the model exactly how we received it
        -- Cmd.none means "i don't want to run any commands this time"
        NoOp ->
            (model, Cmd.none)
        WidgetMsg subMsg ->
            let
              ( updatedWidgetModel, widgetCmd ) =
                Elementary.Widget.update subMsg model.widgetModel
            in
              ( { model | widgetModel = updatedWidgetModel }, Cmd.map WidgetMsg widgetCmd)
