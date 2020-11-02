module Page.Group exposing (..)

import Browser
import Html exposing (Html, div, h1, text)
import Models.Event as Event exposing (Event)


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = sub
        , view = view
        }


sub _ =
    Sub.none


type alias Model =
    { name : String
    , events : List Event
    }


type Msg
    = NewEvent String String
    | NewComment String


init : String -> ( Model, Cmd Msg )
init name =
    ( Model name []
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.name ]
        , div [] (List.map Event.view model.events)
        ]
