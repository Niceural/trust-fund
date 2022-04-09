"reach 0.1";

const common = {
  funded: Fun([], Null),
  ready: Fun([], Null),
  received: Fun([UInt], Null),
};

export const main = Reach.App(
  {},
  [
    Participant("Funder", {
      ...common,
      getParams: Fun(
        [],
        Object({
          receiverAddr: Address,
          payment: UInt,
          maturity: UInt,
          refund: UInt,
          dormant: UInt,
        })
      ),
    }),
    Participant("Receiver", common),
    Participant("Bystander", common),
  ],
  (Funder, Receiver, Bystander) => {
    // 1. the Funder publishes the parameters of the funds and makes the initial deposit;
    Funder.publish(receiverAddr, payment, maturity, refund, dormant).pay(
      payment
    );

    // 2. the consensus remembers who the Receiver is;
    Receiver.set(receiverAddr);
    commit();

    // 3. Everyone waits for the fund to mature;
    wait(maturity);

    // 4. the Receiver may extract the funds with a deadline of 'refund'
    Receiver.publish().timeout(refund, () => {
      // 5. the Funder may extract the funds with a deadline of dormant
      Funder.publish().timeout(dormant, () => {
        // 6. the Bystander may extract the funds with no deadline.
        Bystander.publish();
        transfer(payment).to(Bystander);
        commit();
        exit();
      });
    });
  }
);
