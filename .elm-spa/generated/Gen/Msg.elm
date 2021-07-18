module Gen.Msg exposing (Msg(..))

import Gen.Params.Advanced
import Gen.Params.Element
import Gen.Params.Git
import Gen.Params.Home_
import Gen.Params.Sandbox
import Gen.Params.Static
import Gen.Params.Dynamic.Name_
import Gen.Params.NotFound
import Pages.Advanced
import Pages.Element
import Pages.Git
import Pages.Home_
import Pages.Sandbox
import Pages.Static
import Pages.Dynamic.Name_
import Pages.NotFound


type Msg
    = Advanced Pages.Advanced.Msg
    | Element Pages.Element.Msg
    | Git Pages.Git.Msg
    | Sandbox Pages.Sandbox.Msg
    | Static Never
    | Dynamic__Name_ Never

