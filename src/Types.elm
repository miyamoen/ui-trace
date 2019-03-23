module Types exposing (Model, Msg(..), Window)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Route exposing (Route)
import Url exposing (Url)


type alias Model =
    { key : Key, window : Window, route : Route }


type alias Window =
    { width : Float, height : Float }


type Msg
    = NoOp
    | ClickedLink UrlRequest
    | UrlChanged Url
    | ResizeWindow Int Int
