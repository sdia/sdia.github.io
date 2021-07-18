module Gen.Params.Dynamic.Name_ exposing (Params, parser)

import Url.Parser as Parser exposing ((</>), Parser)


type alias Params =
    { name : String }


parser =
    Parser.map Params (Parser.s "dynamic" </> Parser.string)

