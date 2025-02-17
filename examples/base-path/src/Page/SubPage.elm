module Page.SubPage exposing (Data, Model, Msg, page)

import Css exposing (..)
import Css.Global
import DataSource exposing (DataSource)
import DataSource.File
import Head
import Head.Seo as Seo
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Path
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Data =
    ()


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "TODO"
        , locale = Nothing
        , title = "TODO title" -- metadata.title -- TODO
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = ""
    , body =
        [ Html.label [ Attr.for "note" ] []
        , div []
            [ Css.Global.global
                [ Css.Global.typeSelector "div"
                    [ Css.Global.children
                        [ Css.Global.typeSelector "p"
                            [ fontSize (px 14)
                            , color (rgb 255 0 0)
                            ]
                        ]
                    ]
                ]
            , div []
                [ p []
                    [ text "Here is the Elm logo:"
                    ]
                , img
                    [ Attr.src (Path.fromString "/images/elm-logo.svg" |> Path.toAbsolute)
                    , Attr.css [ maxWidth (rem 10) ]
                    ]
                    []
                ]
            ]
        ]
    }
