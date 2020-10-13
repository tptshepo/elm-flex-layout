module Flex exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Maybe exposing (withDefault)


type Direction
    = Row
    | Column


type Alignment
    = Start
    | Center
    | End
    | SpaceBetween
    | SpaceAround
    | SpaceEvenly
    | Stretch


fxLayout : Direction -> Alignment -> Alignment -> List (Attribute msg)
fxLayout direction alignHorizontal alignVertical =
    let
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

        styles1 =
            style "flex-direction" flexDirection :: []

        styles2 =
            style "display" "flex" :: styles1

        styles3 =
            style "box-sizing" "border-box" :: styles2

        styles =
            styles1 ++ styles2 ++ styles3
    in
    styles
