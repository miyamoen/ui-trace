module Main exposing (init, update)

import Browser exposing (Document, UrlRequest(..))
import Browser.Events
import Browser.Navigation as Nav exposing (Key)
import Html
import Url exposing (Url)


type alias Model =
    { key : Key, window : Window }


type alias Window =
    { width : Float, height : Float }


type Msg
    = NoOp
    | ClickedLink UrlRequest
    | UrlChanged Url
    | ResizeWindow Int Int


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
    ( { window = window, key = key }, Cmd.none )


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
            ( model, Cmd.none )

        ResizeWindow w h ->
            ( { model | window = { width = toFloat w, height = toFloat h } }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize ResizeWindow


view : Model -> Document Msg
view model =
    { title = "UI Trace"
    , body = [ Html.text <| Debug.toString model ]
    }
