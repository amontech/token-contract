const BigNumber = web3.BigNumber;

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should();

const AMNTokenMock = artifacts.require('AMNToken');

contract('AMNToken', accounts => {
  let amnToken = null;

  const _name = 'Amon';
  const _symbol = 'AMN';
  const _decimals = 18;

  beforeEach(async function () {
    amnToken = await AMNTokenMock.new();
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
});
