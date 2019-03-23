module Route exposing (Route(..), parse, parser, switchUrl)

import Url exposing (Url)
import Url.Builder as Builder
import Url.Parser as Parser exposing ((</>), Parser, s)


type Route
    = Switch


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Switch <| s "switch"
        ]


parse : Url -> Route
parse url =
    Parser.parse parser url
        |> Maybe.withDefault Switch


switchUrl : String
switchUrl =
    Builder.relative [ "switch" ] []
