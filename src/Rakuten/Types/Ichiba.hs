{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}

module Rakuten.Types.Ichiba
    ( IchibaItems
    , ItemWrap
    , Item
    , GenreInformation
    , ParentGenre
    , CurrentGenre
    , ChiledGenre
    , TagGroupWrap
    , TagGroup
    , TagWrap
    , Tag
    , IchibaItemSearchParam
    ) where

import           Data.Extensible
import           Data.Text           (Text)
import           Rakuten.Types.Base  (ImageUrl)
import           Rakuten.Types.Class ()

type IchibaItems =
  Record '[
    "count" ':> Int,
    "page" ':> Int,
    "first" ':> Int,
    "last" ':> Int,
    "hits" ':> Int,
    "carrier" ':> Int,
    "pageCount" ':> Int,
    "Items" ':> [ItemWrap],
    "GenreInformation" ':> [GenreInformation],
    "TagInformation" ':> [TagGroupWrap]
  ]

type ItemWrap = Record '[ "Item" ':> Item ]

type Item =
  Record '[
    "itemName" ':> Text,
    "catchcopy" ':> Text,
    "itemCode" ':> Text,
    "itemPrice" ':> Int,
    "itemCaption" ':> Text,
    "itemUrl" ':> Text,
    "shopUrl" ':> Text,
    "smallImageUrls" ':> [ImageUrl],
    "mediumImageUrls" ':> [ImageUrl],
    "affiliateUrl" ':> Text,
    "shopAffiliateUrl" ':> Text,
    "imageFlag" ':> Int,
    "availability" ':> Int,
    "taxFlag" ':> Int,
    "postageFlag" ':> Int,
    "creditCardFlag" ':> Int,
    "shopOfTheYearFlag" ':> Int,
    "shipOverseasFlag" ':> Int,
    "shipOverseasArea" ':> Text,
    "asurakuFlag" ':> Int,
    "asurakuClosingTime" ':> Text,
    "asurakuArea" ':> Text,
    "affiliateRate" ':> Double,
    "startTime" ':> Text,
    "endTime" ':> Text,
    "reviewCount" ':> Int,
    "reviewAverage" ':> Double,
    "pointRate" ':> Int,
    "pointRateStartTime" ':> Text,
    "pointRateEndTime" ':> Text,
    "giftFlag" ':> Int,
    "shopName" ':> Text,
    "shopCode" ':> Text,
    "genreId" ':> Text,
    "tagIds" ':> [Int]
  ]

type GenreInformation =
  Record '[
    "parent" ':> [ParentGenre],
    "current" ':> [CurrentGenre],
    "chiled" ':> [ChiledGenre]
  ]

type ParentGenre =
  Record '[
    "genreId" ':> Text,
    "genreName" ':> Text,
    "genreLevel" ':> Int
  ]

type CurrentGenre =
  Record '[
    "genreId" ':> Text,
    "genreName" ':> Text,
    "itemCount" ':> Int,
    "genreLevel" ':> Int
  ]

type ChiledGenre =
  Record '[
    "genreId" ':> Text,
    "genreName" ':> Text,
    "itemCount" ':> Int,
    "genreLevel" ':> Int
  ]

type TagGroupWrap = Record '[ "TagGroup" ':> TagGroup ]

type TagGroup =
  Record '[
    "tagGroupName" ':> Text,
    "tagGroupId" ':> Text,
    "tags" ':> [TagWrap]
  ]

type TagWrap = Record '[ "tag" ':> Tag ]

type Tag =
  Record '[
    "tagId" ':> Int,
    "tagName" ':> Text,
    "parentTagId" ':> Text,
    "itemCount" ':> Int
  ]

type IchibaItemSearchParam =
  Record '[
    "keyword" ':> Text,
    "shopCode" ':> Maybe Text,
    "itemCode" ':> Maybe Text,
    "genreId" ':> Maybe Int,
    "tagId" ':> Maybe Int,
    "hits" ':> Maybe Int,
    "page" ':> Maybe Int,
    "sort" ':> Maybe Text,
    "minPrice" ':> Maybe Int,
    "maxPrice" ':> Maybe Int,
    "availability" ':> Maybe Bool,
    "field" ':> Maybe Bool,
    "carrier" ':> Maybe Bool,
    "imageFlag" ':> Maybe Bool,
    "orFlag" ':> Maybe Bool,
    "NGKeyword" ':> Maybe Text,
    "purchaseType" ':> Maybe Int,
    "shipOverseasFlag" ':> Maybe Bool,
    "shipOverseasArea" ':> Maybe Text,
    "asurakuFlag" ':> Maybe Bool,
    "asurakuArea" ':> Maybe Int,
    "pointRateFlag" ':> Maybe Bool,
    "pointRate" ':> Maybe Int,
    "postageFlag" ':> Maybe Bool,
    "creditCardFlag" ':> Maybe Bool,
    "giftFlag" ':> Maybe Bool,
    "hasReviewFlag" ':> Maybe Bool,
    "maxAffiliateRate" ':> Maybe Double,
    "minAffiliateRate" ':> Maybe Double,
    "hasMovieFlag" ':> Maybe Bool,
    "pamphletFlag" ':> Maybe Bool,
    "appointDeliveryDateFlag" ':> Maybe Bool,
    "genreInformationFlag" ':> Maybe Bool,
    "tagInformationFlag" ':> Maybe Bool
  ]