// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {MessageOutEvent} from "./Types.sol";

library NonEvmDecoder {
    bytes internal constant SOLANA_TOPIC = "MessageOutEvent";
    bytes internal constant BTC_TOPIC = "MessageOutEvent";
    bytes internal constant TON_TOPIC = hex"34a7e0e8";

    function getTopic(
        bytes memory log
    ) internal pure returns (bytes memory addr, bytes memory topic, bytes memory bytesLog) {
        (addr, topic, bytesLog) = abi.decode(log, (bytes, bytes, bytes));
    }

    function decodeMessageOut(bytes memory bytesLog) internal pure returns (MessageOutEvent memory outEvent) {
        outEvent = abi.decode(bytesLog, (MessageOutEvent));
    }
}
