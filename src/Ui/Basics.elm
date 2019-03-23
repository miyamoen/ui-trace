module Ui.Basics exposing
    ( attributes, options, toHtml
    , when
    , class, id, title
    )

{-|

@docs attributes, options, toHtml


## Attributes

@docs when
@docs class, id, title

-}

import Element exposing (..)
import Html exposing (Html)
import Html.Attributes


options : List Option
options =
    [ focusStyle
        { borderColor = Nothing
        , backgroundColor = Nothing
        , shadow = Nothing
        }
    ]


attributes : List (Attribute msg)
attributes =
    []


toHtml : Element msg -> Html msg
toHtml element =
    layoutWith { options = options } attributes element


when : Bool -> Attribute msg -> Attribute msg
when bool attr =
    if bool then
        attr

    else
        class ""



-- Attributes


class : String -> Attribute msg
class string =
    htmlAttribute <| Html.Attributes.class string


id : String -> Attribute msg
id string =
    htmlAttribute <| Html.Attributes.id string


title : String -> Attribute msg
title string =
    htmlAttribute <| Html.Attributes.title string
