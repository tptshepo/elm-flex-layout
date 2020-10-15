module Flex exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type Direction
    = Row
    | Column


row : Direction
row =
    Row


column : Direction
column =
    Column


type Alignment
    = Start
    | Center
    | End
    | SpaceBetween
    | SpaceAround
    | SpaceEvenly
    | Stretch


start : Alignment
start =
    Start


center : Alignment
center =
    Center


end : Alignment
end =
    End


spaceBetween : Alignment
spaceBetween =
    SpaceBetween


spaceAround : Alignment
spaceAround =
    SpaceAround


spaceEvenly : Alignment
spaceEvenly =
    SpaceEvenly


stretch : Alignment
stretch =
    Stretch


fxLayout : Direction -> Alignment -> Alignment -> List (Attribute msg)
fxLayout direction alignHorizontal alignVertical =
    let
        flexDirection : String
        flexDirection =
            if direction == Row then
                "row"

            else
                "column"

        aHorizontal =
            -- Row
            if direction == Row then
                case alignHorizontal of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    SpaceAround ->
                        "space-around"

                    SpaceBetween ->
                        "space-between"

                    SpaceEvenly ->
                        "space-evenly"

                    -- set to default -> flex-start
                    _ ->
                        "flex-start"

            else
                -- Column
                case alignHorizontal of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    Stretch ->
                        "stretch"

                    -- set to default -> stretch
                    _ ->
                        "stretch"

        aVertical : String
        aVertical =
            -- Row
            if direction == Row then
                case alignVertical of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    Stretch ->
                        "stretch"

                    -- set to default -> stretch
                    _ ->
                        "stretch"

            else
                -- Column
                case alignVertical of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    Stretch ->
                        "stretch"

                    SpaceAround ->
                        "space-around"

                    SpaceBetween ->
                        "space-between"

                    SpaceEvenly ->
                        "space-evenly"

        defaultStyles : List (Attribute msg)
        defaultStyles =
            [ style "flex-direction" flexDirection
            , style "display" "flex"
            , style "box-sizing" "border-box"
            ]

        computedStyles : List (Attribute msg)
        computedStyles =
            -- row
            if direction == Row then
                [ style "place-content" (aVertical ++ " " ++ aHorizontal)
                , style "align-items" aVertical
                ]

            else
                -- Column
                [ style "place-content" (aHorizontal ++ " " ++ aVertical)
                , style "align-items" aHorizontal
                ]

        styles =
            defaultStyles ++ computedStyles
    in
    styles
