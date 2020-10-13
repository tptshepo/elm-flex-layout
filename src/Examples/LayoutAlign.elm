module Examples.LayoutAlign exposing (..)

import Flex exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


main : Html msg
main =
    div ([] ++ fxLayout Flex.Row Flex.Start Flex.Stretch)
        [ div
            [ style "height" "100px"
            , style "width" "100px"
            , style "background-color" "blue"
            ]
            []
        , div
            [ style "height" "100px"
            , style "width" "100px"
            , style "background-color" "green"
            ]
            []
        , div
            [ style "height" "100px"
            , style "width" "100px"
            , style "background-color" "yellow"
            ]
            []
        ]
