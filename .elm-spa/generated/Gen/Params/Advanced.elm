module Gen.Params.Advanced exposing (Params, parser)

import Url.Parser as Parser exposing ((</>), Parser)


type alias Params =
    ()


parser =
    (Parser.s "advanced")

