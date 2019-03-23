module Ui exposing (view)

import Browser exposing (Document)
import Element exposing (..)
import Route
import Types exposing (..)
import Ui.Basics exposing (toHtml)


view : Model -> Document Msg
view model =
    { title = toTitle model
    , body = [ toHtml <| router model ]
    }


router : Model -> Element Msg
router model =
    case model.route of
        Route.Switch ->
            text "switch"


toTitle : Model -> String
toTitle model =
    case model.route of
        Route.Switch ->
            "Switch"
