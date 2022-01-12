-- File auto generated by purescript-bridge! --
module Plutus.Contract.Checkpoint where

import Prelude
import Control.Lazy (defer)
import Data.Argonaut.Core (jsonNull)
import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>))
import Data.Argonaut.Encode (class EncodeJson, encodeJson)
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<))
import Data.BigInt.Argonaut (BigInt)
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Type.Proxy (Proxy(Proxy))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson as E
import Data.Map as Map

newtype CheckpointError
  = JSONDecodeError String

derive instance eqCheckpointError :: Eq CheckpointError

instance showCheckpointError :: Show CheckpointError where
  show a = genericShow a

instance encodeJsonCheckpointError :: EncodeJson CheckpointError where
  encodeJson = defer \_ -> E.encode $ unwrap >$< E.value

instance decodeJsonCheckpointError :: DecodeJson CheckpointError where
  decodeJson = defer \_ -> D.decode $ (JSONDecodeError <$> D.value)

derive instance genericCheckpointError :: Generic CheckpointError _

derive instance newtypeCheckpointError :: Newtype CheckpointError _

--------------------------------------------------------------------------------
_JSONDecodeError :: Iso' CheckpointError String
_JSONDecodeError = _Newtype

--------------------------------------------------------------------------------
data CheckpointLogMsg
  = LogFoundValueRestoringKey CheckpointKey
  | LogDecodingErrorAtKey CheckpointKey
  | LogNoValueForKey CheckpointKey
  | LogDoCheckpoint
  | LogAllocateKey
  | LogRetrieve CheckpointKey
  | LogStore CheckpointKey CheckpointKey
  | LogKeyUpdate CheckpointKey CheckpointKey

instance showCheckpointLogMsg :: Show CheckpointLogMsg where
  show a = genericShow a

instance encodeJsonCheckpointLogMsg :: EncodeJson CheckpointLogMsg where
  encodeJson =
    defer \_ -> case _ of
      LogFoundValueRestoringKey a -> E.encodeTagged "LogFoundValueRestoringKey" a E.value
      LogDecodingErrorAtKey a -> E.encodeTagged "LogDecodingErrorAtKey" a E.value
      LogNoValueForKey a -> E.encodeTagged "LogNoValueForKey" a E.value
      LogDoCheckpoint -> encodeJson { tag: "LogDoCheckpoint", contents: jsonNull }
      LogAllocateKey -> encodeJson { tag: "LogAllocateKey", contents: jsonNull }
      LogRetrieve a -> E.encodeTagged "LogRetrieve" a E.value
      LogStore a b -> E.encodeTagged "LogStore" (a /\ b) (E.tuple (E.value >/\< E.value))
      LogKeyUpdate a b -> E.encodeTagged "LogKeyUpdate" (a /\ b) (E.tuple (E.value >/\< E.value))

instance decodeJsonCheckpointLogMsg :: DecodeJson CheckpointLogMsg where
  decodeJson =
    defer \_ ->
      D.decode
        $ D.sumType "CheckpointLogMsg"
        $ Map.fromFoldable
            [ "LogFoundValueRestoringKey" /\ D.content (LogFoundValueRestoringKey <$> D.value)
            , "LogDecodingErrorAtKey" /\ D.content (LogDecodingErrorAtKey <$> D.value)
            , "LogNoValueForKey" /\ D.content (LogNoValueForKey <$> D.value)
            , "LogDoCheckpoint" /\ pure LogDoCheckpoint
            , "LogAllocateKey" /\ pure LogAllocateKey
            , "LogRetrieve" /\ D.content (LogRetrieve <$> D.value)
            , "LogStore" /\ D.content (D.tuple $ LogStore </$\> D.value </*\> D.value)
            , "LogKeyUpdate" /\ D.content (D.tuple $ LogKeyUpdate </$\> D.value </*\> D.value)
            ]

derive instance genericCheckpointLogMsg :: Generic CheckpointLogMsg _

--------------------------------------------------------------------------------
_LogFoundValueRestoringKey :: Prism' CheckpointLogMsg CheckpointKey
_LogFoundValueRestoringKey =
  prism' LogFoundValueRestoringKey case _ of
    (LogFoundValueRestoringKey a) -> Just a
    _ -> Nothing

_LogDecodingErrorAtKey :: Prism' CheckpointLogMsg CheckpointKey
_LogDecodingErrorAtKey =
  prism' LogDecodingErrorAtKey case _ of
    (LogDecodingErrorAtKey a) -> Just a
    _ -> Nothing

_LogNoValueForKey :: Prism' CheckpointLogMsg CheckpointKey
_LogNoValueForKey =
  prism' LogNoValueForKey case _ of
    (LogNoValueForKey a) -> Just a
    _ -> Nothing

_LogDoCheckpoint :: Prism' CheckpointLogMsg Unit
_LogDoCheckpoint =
  prism' (const LogDoCheckpoint) case _ of
    LogDoCheckpoint -> Just unit
    _ -> Nothing

_LogAllocateKey :: Prism' CheckpointLogMsg Unit
_LogAllocateKey =
  prism' (const LogAllocateKey) case _ of
    LogAllocateKey -> Just unit
    _ -> Nothing

_LogRetrieve :: Prism' CheckpointLogMsg CheckpointKey
_LogRetrieve =
  prism' LogRetrieve case _ of
    (LogRetrieve a) -> Just a
    _ -> Nothing

_LogStore :: Prism' CheckpointLogMsg { a :: CheckpointKey, b :: CheckpointKey }
_LogStore =
  prism' (\{ a, b } -> (LogStore a b)) case _ of
    (LogStore a b) -> Just { a, b }
    _ -> Nothing

_LogKeyUpdate :: Prism' CheckpointLogMsg { a :: CheckpointKey, b :: CheckpointKey }
_LogKeyUpdate =
  prism' (\{ a, b } -> (LogKeyUpdate a b)) case _ of
    (LogKeyUpdate a b) -> Just { a, b }
    _ -> Nothing

--------------------------------------------------------------------------------
newtype CheckpointKey
  = CheckpointKey BigInt

instance showCheckpointKey :: Show CheckpointKey where
  show a = genericShow a

instance encodeJsonCheckpointKey :: EncodeJson CheckpointKey where
  encodeJson = defer \_ -> E.encode $ unwrap >$< E.value

instance decodeJsonCheckpointKey :: DecodeJson CheckpointKey where
  decodeJson = defer \_ -> D.decode $ (CheckpointKey <$> D.value)

derive instance genericCheckpointKey :: Generic CheckpointKey _

derive instance newtypeCheckpointKey :: Newtype CheckpointKey _

--------------------------------------------------------------------------------
_CheckpointKey :: Iso' CheckpointKey BigInt
_CheckpointKey = _Newtype