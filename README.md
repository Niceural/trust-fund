# Trust Fund

This application allows a payer called Alice to fund an account. The receiver called Bob must wait a certain amount of time, set by Alice, to access the funds, or they will be reverted back to Alice. However, if she does not claim the funds, they become dormant and any third party can retrieve the funds.

# Table of Contents

# Backend

## Problem Analysis

The aims and objectives of this application are described below:

1. allow a user to transfer funds securely;
2. be protected against malicious miners;
3. lock the funds for a certain amount of time, set by the payer, after being transferred;
4. if no one claims the funds, the funds are left for anyone to take them.

This application involves three participants:

- Alice (the Funder): she knows the amount, the address of the receiver (Bob), the period of time during which the funds are locked and the period of time past which the funds are left dormant;
- Bob (the Receiver)
- Jack (a Bystander)

## Data Definition
