# Trust Fund

This application allows a Funder to fund an account. The Receiver must wait a certain amount of time, set by the Payer, to access the funds, or they will be reverted back to the Payer. However, if they do not claim the funds, they become dormant and any third party called Bystander can retrieve the funds.

# Table of Contents

# Backend

## Problem Analysis

The aims and objectives of this application are described below:

1. allow a user to transfer funds securely;
2. be protected against malicious miners;
3. lock the funds for a certain amount of time, set by the payer, after being transferred;
4. if no one claims the funds, the funds are left for anyone to take them.

This application involves three participants:

- the Funder: they know the amount, the address of the Receiver, the period of time during which the funds are locked and the period of time past which the funds are left dormant;
- the Receiver
- a Bystander

## Data Definition

## Communication construction

The communication pattern for this application is described below:

1. the Funder publishes the parameters of the fund and makes the initial deposit;
2. the consensus remembers who the Receiver is;
3. everyone waits for the funds to mature;
4. the Receiver may extract the funds with a deadline of refund;
5. the Funder may extract the funds with a deadline of dormant;
6. the bystander may extract the funds with no deadline.
