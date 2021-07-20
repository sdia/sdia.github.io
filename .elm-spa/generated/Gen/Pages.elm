module Gen.Pages exposing (Model, Msg, init, subscriptions, update, view)

import Browser.Navigation exposing (Key)
import Effect exposing (Effect)
import ElmSpa.Page
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
import Gen.Model as Model
import Gen.Msg as Msg
import Gen.Route as Route exposing (Route)
import Page exposing (Page)
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
import Request exposing (Request)
import Shared
import Task
import Url exposing (Url)
import View exposing (View)


type alias Model =
    Model.Model


type alias Msg =
    Msg.Msg


init : Route -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
init route =
    case route of
        Route.Advanced ->
            pages.advanced.init ()
    
        Route.Element ->
            pages.element.init ()
    
        Route.Git ->
            pages.git.init ()
    
        Route.Helm ->
            pages.helm.init ()
    
        Route.Home_ ->
            pages.home_.init ()
    
        Route.Kubectl ->
            pages.kubectl.init ()
    
        Route.Sandbox ->
            pages.sandbox.init ()
    
        Route.Static ->
            pages.static.init ()
    
        Route.Dynamic__Name_ params ->
            pages.dynamic__name_.init params
    
        Route.NotFound ->
            pages.notFound.init ()


update : Msg -> Model -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
update msg_ model_ =
    case ( msg_, model_ ) of
        ( Msg.Advanced msg, Model.Advanced params model ) ->
            pages.advanced.update params msg model
    
        ( Msg.Element msg, Model.Element params model ) ->
            pages.element.update params msg model
    
        ( Msg.Git msg, Model.Git params model ) ->
            pages.git.update params msg model
    
        ( Msg.Helm msg, Model.Helm params model ) ->
            pages.helm.update params msg model
    
        ( Msg.Kubectl msg, Model.Kubectl params model ) ->
            pages.kubectl.update params msg model
    
        ( Msg.Sandbox msg, Model.Sandbox params model ) ->
            pages.sandbox.update params msg model
    
        ( Msg.Static msg, Model.Static params model ) ->
            pages.static.update params msg model
    
        ( Msg.Dynamic__Name_ msg, Model.Dynamic__Name_ params model ) ->
            pages.dynamic__name_.update params msg model

        _ ->
            \_ _ _ -> ( model_, Effect.none )


view : Model -> Shared.Model -> Url -> Key -> View Msg
view model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> View.none
    
        Model.Advanced params model ->
            pages.advanced.view params model
    
        Model.Element params model ->
            pages.element.view params model
    
        Model.Git params model ->
            pages.git.view params model
    
        Model.Helm params model ->
            pages.helm.view params model
    
        Model.Home_ params ->
            pages.home_.view params ()
    
        Model.Kubectl params model ->
            pages.kubectl.view params model
    
        Model.Sandbox params model ->
            pages.sandbox.view params model
    
        Model.Static params model ->
            pages.static.view params model
    
        Model.Dynamic__Name_ params model ->
            pages.dynamic__name_.view params model
    
        Model.NotFound params ->
            pages.notFound.view params ()


subscriptions : Model -> Shared.Model -> Url -> Key -> Sub Msg
subscriptions model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> Sub.none
    
        Model.Advanced params model ->
            pages.advanced.subscriptions params model
    
        Model.Element params model ->
            pages.element.subscriptions params model
    
        Model.Git params model ->
            pages.git.subscriptions params model
    
        Model.Helm params model ->
            pages.helm.subscriptions params model
    
        Model.Home_ params ->
            pages.home_.subscriptions params ()
    
        Model.Kubectl params model ->
            pages.kubectl.subscriptions params model
    
        Model.Sandbox params model ->
            pages.sandbox.subscriptions params model
    
        Model.Static params model ->
            pages.static.subscriptions params model
    
        Model.Dynamic__Name_ params model ->
            pages.dynamic__name_.subscriptions params model
    
        Model.NotFound params ->
            pages.notFound.subscriptions params ()



-- INTERNALS


pages :
    { advanced : Bundle Gen.Params.Advanced.Params Pages.Advanced.Model Pages.Advanced.Msg
    , element : Bundle Gen.Params.Element.Params Pages.Element.Model Pages.Element.Msg
    , git : Bundle Gen.Params.Git.Params Pages.Git.Model Pages.Git.Msg
    , helm : Bundle Gen.Params.Helm.Params Pages.Helm.Model Pages.Helm.Msg
    , home_ : Static Gen.Params.Home_.Params
    , kubectl : Bundle Gen.Params.Kubectl.Params Pages.Kubectl.Model Pages.Kubectl.Msg
    , sandbox : Bundle Gen.Params.Sandbox.Params Pages.Sandbox.Model Pages.Sandbox.Msg
    , static : Bundle Gen.Params.Static.Params () Never
    , dynamic__name_ : Bundle Gen.Params.Dynamic.Name_.Params () Never
    , notFound : Static Gen.Params.NotFound.Params
    }
pages =
    { advanced = bundle Pages.Advanced.page Model.Advanced Msg.Advanced
    , element = bundle Pages.Element.page Model.Element Msg.Element
    , git = bundle Pages.Git.page Model.Git Msg.Git
    , helm = bundle Pages.Helm.page Model.Helm Msg.Helm
    , home_ = static Pages.Home_.view Model.Home_
    , kubectl = bundle Pages.Kubectl.page Model.Kubectl Msg.Kubectl
    , sandbox = bundle Pages.Sandbox.page Model.Sandbox Msg.Sandbox
    , static = bundle Pages.Static.page Model.Static Msg.Static
    , dynamic__name_ = bundle Pages.Dynamic.Name_.page Model.Dynamic__Name_ Msg.Dynamic__Name_
    , notFound = static Pages.NotFound.view Model.NotFound
    }


type alias Bundle params model msg =
    ElmSpa.Page.Bundle params model msg Shared.Model (Effect Msg) Model Msg (View Msg)


bundle page toModel toMsg =
    ElmSpa.Page.bundle
        { redirecting =
            { model = Model.Redirecting_
            , view = View.none
            }
        , toRoute = Route.fromUrl
        , toUrl = Route.toHref
        , fromCmd = Effect.fromCmd
        , mapEffect = Effect.map toMsg
        , mapView = View.map toMsg
        , toModel = toModel
        , toMsg = toMsg
        , page = page
        }


type alias Static params =
    Bundle params () Never


static : View Never -> (params -> Model) -> Static params
static view_ toModel =
    { init = \params _ _ _ -> ( toModel params, Effect.none )
    , update = \params _ _ _ _ _ -> ( toModel params, Effect.none )
    , view = \_ _ _ _ _ -> View.map never view_
    , subscriptions = \_ _ _ _ _ -> Sub.none
    }
    
