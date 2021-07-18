module Gen.Model exposing (Model(..))

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


type Model
    = Redirecting_
    | Advanced Gen.Params.Advanced.Params Pages.Advanced.Model
    | Element Gen.Params.Element.Params Pages.Element.Model
    | Git Gen.Params.Git.Params Pages.Git.Model
    | Home_ Gen.Params.Home_.Params
    | Sandbox Gen.Params.Sandbox.Params Pages.Sandbox.Model
    | Static Gen.Params.Static.Params ()
    | Dynamic__Name_ Gen.Params.Dynamic.Name_.Params ()
    | NotFound Gen.Params.NotFound.Params

