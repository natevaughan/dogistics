// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ShippingRequest {

  // start point or end point
  struct Location {
    uint lat;
    uint lon;
    string instructions;
  }

  // offer to
  struct Bid {
    uint amount;
    uint deliveryDate;
    address bidder;
  }

  address public originator = msg.sender;
  string description;
  Location origin;
  Location destination;
  uint weightKG;
  uint heightCM;
  uint widthCM;
  uint lengthCM;

  Bid[] public bids;

  constructor(
    string memory description,
    Location memory origin,
    Location memory destination,
    uint memory weightKG,
    uint memory heightCM,
    uint memory widthCM,
    uint memory lengthCM
  ) {
    originator = msg.sender;
  }

  function winningBid() public view returns (Bid winningBid_) {
    uint winningBidAmount = 0;
    for (uint b = 0; b < bids.length; b++) {
      if (bids[b].amount > winningBidAmount) {
        winningBidAmount = bids[b].amount;
        winningBid_ = bids[b];
      }
    }
  }
}
