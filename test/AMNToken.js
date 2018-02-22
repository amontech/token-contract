const BigNumber = web3.BigNumber;

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should();

const AMNToken = artifacts.require('AMNToken');
const ERC223ReceivingContract = artifacts.require('ERC223ReceivingContract');
const EmptyContract = artifacts.require('EmptyContract');

contract('AMNToken', ([owner, account1, account2]) => {
  let amnToken = null;
  let receivingContract = null;
  let emptyContract = null;

  const _name = 'Amon';
  const _symbol = 'AMN';
  const _decimals = 18;
  const _totalSupply = (1.6 * 10 ** 9) * (10 ** _decimals);

  beforeEach(async function () {
    amnToken = await AMNToken.new();
    receivingContract = await ERC223ReceivingContract.new();
    emptyContract = await EmptyContract.new();
  });

  it('has a name', async function () {
    const name = await amnToken.name();
    name.should.be.equal(_name);
  });

  it('has a symbol', async function () {
    const symbol = await amnToken.symbol();
    symbol.should.be.equal(_symbol);
  });

  it('has an amount of decimals', async function () {
    const decimals = await amnToken.decimals();
    decimals.should.be.bignumber.equal(_decimals);
  });

  it('has a total supply', async function () {
    const totalSupply = await amnToken.totalSupply();
    totalSupply.should.be.bignumber.equal(_totalSupply);
  });

  it('total given to owner', async function () {
    const ownerBalance = await amnToken.balanceOf(owner);
    ownerBalance.should.be.bignumber.equal(_totalSupply);
  });

  it('transfer', async function () {
    const amount = 100;
    let account1Balance = await amnToken.balanceOf(account1);
    account1Balance.should.be.bignumber.equal(0);

    const { logs } = await amnToken.transfer(account1, amount, { from: owner });

    account1Balance = await amnToken.balanceOf(account1);
    account1Balance.should.be.bignumber.equal(amount);
    const ownerBalance = await amnToken.balanceOf(owner);
    ownerBalance.should.be.bignumber.equal(new BigNumber(_totalSupply).sub(amount));

    assert.equal(logs.length, 1);
    assert.equal(logs[0].event, 'Transfer');
    assert.equal(logs[0].args.from, owner);
    assert.equal(logs[0].args.to, account1);
    assert(logs[0].args.value.eq(amount));

  });

  it('transfer to contract', function (done) {

    (async () => {

      const amount = 100;
      let receivingContractBalance = await amnToken.balanceOf(receivingContract.address);
      receivingContractBalance.should.be.bignumber.equal(0);

      const { logs } = await amnToken.transfer(receivingContract.address, amount, { from: owner });

      receivingContractBalance = await amnToken.balanceOf(receivingContract.address);
      receivingContractBalance.should.be.bignumber.equal(amount);

      assert.equal(logs.length, 1);
      assert.equal(logs[0].event, 'Transfer');
      assert.equal(logs[0].args.from, owner);
      assert.equal(logs[0].args.to, receivingContract.address);
      assert(logs[0].args.value.eq(amount));

      const events = receivingContract.TokenDeposit(null, (error, event) => {

        assert.equal(event.event, 'TokenDeposit');
        assert.equal(event.args.sender, owner);
        assert.equal(event.args.token, amnToken.address);
        assert.equal(event.args.data, undefined);
        event.args.value.should.be.bignumber.equal(amount);

        events.stopWatching();
        done();
      });

    })().catch(done);

  });

  it('cannot transfer to empty contract', async function () {

    const amount = 100;
    let emptyContractBalance = await amnToken.balanceOf(emptyContract.address);
    emptyContractBalance.should.be.bignumber.equal(0);

    let thrown = false;
    try {
      await amnToken.transfer(emptyContract.address, amount, { from: owner });
    } catch(error) {
      thrown = true;
      assert(error.message.includes('revert'));
      emptyContractBalance = await amnToken.balanceOf(emptyContract.address);
      emptyContractBalance.should.be.bignumber.equal(0);
    }

    assert(thrown);
    
  });

});
