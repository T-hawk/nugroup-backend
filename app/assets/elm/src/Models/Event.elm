module Models.Event exposing (..)

import Html exposing (..)


type alias Event =
    { title : String
    , content : String
    }


view : Event -> Html msg
view event =
    div []
        [ h3 [] [ text event.title ]
        , p [] [ text event.content ]
        ]
