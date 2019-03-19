module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import Browser
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)

---- MODEL ----


type alias Model =
    { 
    firstLetter : String,
    secondLetter : String
  }


init : ( Model, Cmd Msg )
init =
    ( { 
    firstLetter = "",
    secondLetter = ""
  }, Cmd.none )



---- UPDATE ----


type Msg
    = ChangeFirst String
  | ChangeSecond String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( case msg of
    ChangeFirst firstLetter -> 
        { model | firstLetter = firstLetter }

    ChangeSecond secondLetter ->
      { model | secondLetter = secondLetter }
      , Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [class "firstLevelBackground"]
    [ 
        div [class "inputWrapper"] [ 
            input [ value model.firstLetter, onInput ChangeFirst, class "firstLevelInput" ] []
            , input [ value model.secondLetter, onInput ChangeSecond, class "firstLevelInput" ] []
        ]
    , validate model
    ]

validate : Model -> Html msg
validate model =
    if (model.firstLetter == "H" && model.secondLetter == "K") then 
        div [ class "circle green blink" ] []
    else
        div [ class "circle red blink" ] []

---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }