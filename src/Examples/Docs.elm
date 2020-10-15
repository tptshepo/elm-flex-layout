module Examples.Docs exposing (..)

import Browser
import Flex exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (..)



-- Model


type alias LayoutModel =
    { direction : Direction
    , horizontalAlignment : Alignment
    , verticalAlignment : Alignment
    }


init : () -> ( LayoutModel, Cmd Msg )
init _ =
    ( { direction = Flex.row
      , horizontalAlignment = Flex.spaceAround
      , verticalAlignment = Flex.center
      }
    , Cmd.none
    )



-- Update


type Msg
    = LayoutDirection Direction Bool
    | HorizontalAlignment Alignment Bool
    | VerticalAlignment Alignment Bool


update : Msg -> LayoutModel -> ( LayoutModel, Cmd Msg )
update msg model =
    case msg of
        LayoutDirection direction checked ->
            ( { model | direction = direction }, Cmd.none )

        HorizontalAlignment align checked ->
            ( { model | horizontalAlignment = align }, Cmd.none )

        VerticalAlignment align checked ->
            ( { model | verticalAlignment = align }, Cmd.none )



-- Views


blockStyles : Direction -> String -> String -> String -> String -> String -> List (Attribute msg)
blockStyles direction backgroundColor rowMinWidth rowMinHeight colMinWidth colMinHeight =
    let
        minWidth =
            if direction == Flex.row then
                rowMinWidth

            else
                colMinWidth

        minHeight =
            if direction == Flex.row then
                rowMinHeight

            else
                colMinHeight
    in
    [ style "min-width" minWidth
    , style "min-height" minHeight
    , style "background-color" backgroundColor
    , class "box-item"
    ]


viewBoxContainer : LayoutModel -> Html Msg
viewBoxContainer model =
    let
        hAlign =
            if model.direction == Flex.row then
                model.horizontalAlignment

            else
                model.verticalAlignment

        vAlign =
            if model.direction == Flex.row then
                model.verticalAlignment

            else
                model.horizontalAlignment
    in
    div
        ([ class "box-container" ]
            ++ fxLayout model.direction hAlign vAlign
        )
        [ div
            ([] ++ blockStyles model.direction "#009688" "75px" "50px" "75px" "50px")
            [ text "1" ]
        , div
            ([]
                ++ blockStyles model.direction "#3949ab" "75px" "100px" "125px" "50px"
            )
            [ text "2" ]
        , div
            ([] ++ blockStyles model.direction "#9c27b0" "75px" "50px" "75px" "50px")
            [ text "3" ]
        , div
            ([]
                ++ blockStyles model.direction "#b08752" "75px" "75px" "100px" "50px"
            )
            [ text "4" ]
        , div
            ([] ++ blockStyles model.direction "#5ca6b0" "75px" "50px" "75px" "50px")
            [ text "5" ]
        ]


viewPageTitleContainer : Html Msg
viewPageTitleContainer =
    div ([ class "page-title" ] ++ fxLayout Flex.column Flex.stretch Flex.start)
        [ div ([ style "height" "50px" ] ++ fxLayout Flex.row Flex.start Flex.center)
            [ h5 [ style "margin-right" "20px" ] [ text "Elm Flex Layout:" ]
            , span [] [ text "Version: 1.0.1" ]
            ]
        , div [ style "height" "50px" ]
            [ span []
                [ text "Elm Flex Layout provides a layout API for using Flexbox CSS."
                ]
            ]
        ]


viewTogglesContainer : LayoutModel -> Html Msg
viewTogglesContainer model =
    div
        ([ class "toggle-container" ]
            ++ fxLayout Flex.row Flex.spaceAround Flex.start
        )
        [ viewToggleDirectionContainer model
        , viewToggleHorizontalContainer model
        , viewToggleVerticalContainer model
        ]


viewToggleDirectionContainer : LayoutModel -> Html Msg
viewToggleDirectionContainer model =
    div
        ([ class "toggle-item-container" ]
            ++ fxLayout Flex.column Flex.stretch Flex.start
        )
        [ span [] [ text "Layout Direction" ]
        , br [] []
        , div []
            [ viewRadioButton "direction" "Row" (model.direction == Flex.row) (LayoutDirection Flex.row)
            , viewRadioButton "direction" "Column" (model.direction == Flex.column) (LayoutDirection Flex.column)
            ]
        ]


viewToggleHorizontalContainer : LayoutModel -> Html Msg
viewToggleHorizontalContainer model =
    let
        title =
            if model.direction == Flex.row then
                "Alignment (horizontal)"

            else
                "Alignment (vertical)"
    in
    div
        ([ class "toggle-item-container" ]
            ++ fxLayout Flex.column Flex.stretch Flex.start
        )
        [ span [] [ text title ]
        , br [] []
        , div []
            [ viewRadioButton "hAlign" "Start" (model.horizontalAlignment == Flex.start) (HorizontalAlignment Flex.start)
            , viewRadioButton "hAlign" "Center" (model.horizontalAlignment == Flex.center) (HorizontalAlignment Flex.center)
            , viewRadioButton "hAlign" "End" (model.horizontalAlignment == Flex.end) (HorizontalAlignment Flex.end)
            , viewRadioButton "hAlign" "Space Around" (model.horizontalAlignment == Flex.spaceAround) (HorizontalAlignment Flex.spaceAround)
            , viewRadioButton "hAlign" "Space Between" (model.horizontalAlignment == Flex.spaceBetween) (HorizontalAlignment Flex.spaceBetween)
            , viewRadioButton "hAlign" "Space Evenly" (model.horizontalAlignment == Flex.spaceEvenly) (HorizontalAlignment Flex.spaceEvenly)
            ]
        ]


viewToggleVerticalContainer : LayoutModel -> Html Msg
viewToggleVerticalContainer model =
    let
        title =
            if model.direction == Flex.row then
                "Alignment (vertical)"

            else
                "Alignment (horizontal)"
    in
    div
        ([ class "toggle-item-container" ]
            ++ fxLayout Flex.column Flex.stretch Flex.start
        )
        [ span [] [ text title ]
        , br [] []
        , div []
            [ viewRadioButton "vAlign" "Start" (model.verticalAlignment == Flex.start) (VerticalAlignment Flex.start)
            , viewRadioButton "vAlign" "Center" (model.verticalAlignment == Flex.center) (VerticalAlignment Flex.center)
            , viewRadioButton "vAlign" "End" (model.verticalAlignment == Flex.end) (VerticalAlignment Flex.end)
            , viewRadioButton "vAlign" "Stretch" (model.verticalAlignment == Flex.stretch) (VerticalAlignment Flex.stretch)
            ]
        ]


viewRadioButton : String -> String -> Bool -> (Bool -> Msg) -> Html Msg
viewRadioButton group innerText innerChecked onCheckMsg =
    div [ class "form-check" ]
        [ input
            [ class "form-check-input"
            , Attr.type_ "radio"
            , name group
            , checked innerChecked
            , onCheck onCheckMsg
            ]
            []
        , label [ class "form-check-label" ] [ text innerText ]
        ]


view : LayoutModel -> Html Msg
view model =
    div [ class "container" ]
        [ br [] []
        , viewPageTitleContainer
        , br [] []
        , div [ class "card" ]
            [ div [ class "card-body" ]
                [ h5 [ class "card-title" ] [ text "API: fxLayout" ]
                , div ([] ++ fxLayout Flex.column Flex.stretch Flex.start)
                    [ viewBoxContainer model
                    , viewTogglesContainer model
                    ]
                ]
            ]
        ]


main : Program () LayoutModel Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
