// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Math {
    // we defined tp int to return, j will be returned in default value 0
    // since we didn't assign value to it
    function sum() public returns (int k, int j){
        k = 10;
    }

    function sum2() public returns(int return_val){
        // We assign the return value to the return variable
        return_val = 5;
    }

    // Define variable in the return section in the function header, and assign value to them in function body.
    function sum3(int a, int b) public returns(int s, int ss){
        // Here we assigned the value to variables defined in the header
        // and the function will return it eventually
        s = a + b;
        ss = a + s;
    }


    // In the Uniswap v2, the mint functions returns the obtained 'liquidity' as a return value.
    // function mint(address to) external lock returns (uint liquidity) {
    //  //   ...
    //     if (_totalSuppl == 0 ) {
    //         liquidity = Math.sqrt(amount0.mul(amount1)).sub(MINIMUM_LIQUIDITY);
    //         _mint(address(0), MINIMUM_LIQUIDITY); // permanently lock the first MINIMUM_LIQUIDITY TOKENS
    //     } else {
    //         liquidity = Math.min(amount0.mul(_totalSupply) / _reserve0, amount1.mul(_totalSupply) / _reserve1);
    //     }
    //     require(liquidity > 0, 'UniswapV2: INSSUFFICIENT_LIQUIDITY_MINTED');
    //     _mint(to, liquidity);
    //   //  ...
    // }
}

// what does the reserved word `lock` mean or is used for?
// what do the variable `_reserve0` and `_reserve1` mean in the context of this contract?