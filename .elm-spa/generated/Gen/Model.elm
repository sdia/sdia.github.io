module Gen.Model exposing (Model(..))

import Gen.Params.Advanced
import Gen.Params.Element
import Gen.Params.Git
import Gen.Params.Helm
import Gen.Params.Home_
import Gen.Params.Kubectl
import Gen.Params.Sandbox
import Gen.Params.Static
import Gen.Params.Dynamic.Name_
import Gen.Params.NotFound
import Pages.Advanced
import Pages.Element
import Pages.Git
import Pages.Helm
import Pages.Home_
import Pages.Kubectl
import Pages.Sandbox
import Pages.Static
import Pages.Dynamic.Name_
import Pages.NotFound


type Model
    = Redirecting_
    | Advanced Gen.Params.Advanced.Params Pages.Advanced.Model
    | Element Gen.Params.Element.Params Pages.Element.Model
    | Git Gen.Params.Git.Params Pages.Git.Model
    | Helm Gen.Params.Helm.Params Pages.Helm.Model
    | Home_ Gen.Params.Home_.Params
    | Kubectl Gen.Params.Kubectl.Params Pages.Kubectl.Model
    | Sandbox Gen.Params.Sandbox.Params Pages.Sandbox.Model
    | Static Gen.Params.Static.Params ()
    | Dynamic__Name_ Gen.Params.Dynamic.Name_.Params ()
    | NotFound Gen.Params.NotFound.Params

