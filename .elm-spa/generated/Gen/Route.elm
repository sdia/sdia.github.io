module Gen.Route exposing
    ( Route(..)
    , fromUrl
    , toHref
    )

import Gen.Params.Advanced
import Gen.Params.Element
import Gen.Params.Git
import Gen.Params.Home_
import Gen.Params.Kubectl
import Gen.Params.Sandbox
import Gen.Params.Static
import Gen.Params.Dynamic.Name_
import Gen.Params.NotFound
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Advanced
    | Element
    | Git
    | Home_
    | Kubectl
    | Sandbox
    | Static
    | Dynamic__Name_ { name : String }
    | NotFound


fromUrl : Url -> Route
fromUrl =
    Parser.parse (Parser.oneOf routes) >> Maybe.withDefault NotFound


routes : List (Parser (Route -> a) a)
routes =
    [ Parser.map Home_ Gen.Params.Home_.parser
    , Parser.map Advanced Gen.Params.Advanced.parser
    , Parser.map Element Gen.Params.Element.parser
    , Parser.map Git Gen.Params.Git.parser
    , Parser.map Kubectl Gen.Params.Kubectl.parser
    , Parser.map Sandbox Gen.Params.Sandbox.parser
    , Parser.map Static Gen.Params.Static.parser
    , Parser.map NotFound Gen.Params.NotFound.parser
    , Parser.map Dynamic__Name_ Gen.Params.Dynamic.Name_.parser
    ]


toHref : Route -> String
toHref route =
    let
        joinAsHref : List String -> String
        joinAsHref segments =
            "/" ++ String.join "/" segments
    in
    case route of
        Advanced ->
            joinAsHref [ "advanced" ]
    
        Element ->
            joinAsHref [ "element" ]
    
        Git ->
            joinAsHref [ "git" ]
    
        Home_ ->
            joinAsHref []
    
        Kubectl ->
            joinAsHref [ "kubectl" ]
    
        Sandbox ->
            joinAsHref [ "sandbox" ]
    
        Static ->
            joinAsHref [ "static" ]
    
        Dynamic__Name_ params ->
            joinAsHref [ "dynamic", params.name ]
    
        NotFound ->
            joinAsHref [ "not-found" ]

