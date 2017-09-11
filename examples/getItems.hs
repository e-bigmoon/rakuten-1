{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}

import Control.Lens ((&), (.~), (^.))
import Data.Default.Class (def)
import qualified Data.Text.IO as TIO (putStrLn)
import GHC.OverloadedLabels (fromLabel)
import Network.HTTP.Req (runReq, responseBody)
import Rakuten

exec :: AppId -> IO ()
exec appId = do
  let c = defaultRaktenClient appId
  response <- runReq def $ searchIchibaItem c (def & #keyword .~ "デイトナ")
  let items = head $ (responseBody response) ^. getItems
      itemName = items ^. getItem ^. #itemName
  TIO.putStrLn itemName

getItems = fromLabel @"Items"

getItem = fromLabel @"Item"
{-
$ stack repl getItems.hs
*Main> :set -XOverloadedStrings
*Main> exec "Your appId"
Daytona (デイトナ) 2017年 10月号 [雑誌]
-}
