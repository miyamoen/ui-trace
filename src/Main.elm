module Main exposing (init, update)

import Browser exposing (Document, UrlRequest(..))
import Browser.Events
import Browser.Navigation as Nav exposing (Key)
import Route
import Types exposing (..)
import Ui exposing (view)
import Url exposing (Url)


main : Program Window Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChanged
        }


init : Window -> Url -> Key -> ( Model, Cmd Msg )
init window url key =
    ( { window = window, key = key, route = Route.parse url }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ClickedLink (Internal url) ->
            ( model
            , Nav.pushUrl model.key (Url.toString url)
            )

        ClickedLink (External url) ->
            ( model
            , Nav.load url
            )

        UrlChanged url ->
            ( { model | route = Route.parse url }, Cmd.none )

        ResizeWindow w h ->
            ( { model | window = { width = toFloat w, height = toFloat h } }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize ResizeWindow
