const CatLives = artifacts.require('CatLives');

contract('CatLivesContract', function (accounts) {
        console.log(accounts);

        let instance;
        beforeEach(async () => {
                instance = await CatLives.deployed(15);
            }
        );
        it(
            'Cat should start alive', async function () {
                let cat_lives = await instance.LivesLeft.call();
                assert.equal(cat_lives.toNumber(), 8);
            }
        );
        it('Cat should be dead after dying 8 times', async function () {
            for (i = 0; i<8; i++) {
                instance.Die()
            }
            let cat_lives = await instance.LivesLeft.call();
            let cat_status = await instance.IsAlive.call();

            assert.equal(cat_lives.toNumber(), 0);
            assert.equal(cat_status, false);
        });
    }
);
