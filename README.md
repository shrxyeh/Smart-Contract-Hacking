# Smart-Contract-Hacking

### Vulnerable Contract
The vulnerable contract has got 5 ether in it
![Screenshot 2024-01-19 214212](https://github.com/shrxyeh/Smart-Contract-Hacking/assets/77315155/442f4cf1-4c0d-4420-8461-76f74ad5de1c)

### Attacker Contract
The attacker contract has got cuurently 0 ether in it
![Screenshot 2024-01-19 214244](https://github.com/shrxyeh/Smart-Contract-Hacking/assets/77315155/21e95654-e24c-4e09-bd8e-273c9efce051)

### Initiate Attack
Sending 1 ether using the attack function
![Screenshot 2024-01-19 214235](https://github.com/shrxyeh/Smart-Contract-Hacking/assets/77315155/94fb5b0d-2800-477d-8934-6339b0a9436c)

Th re-entrancy attack gets executed successfully and thus stealing all of Vulnerable Contract's funds
![Screenshot 2024-01-19 214249](https://github.com/shrxyeh/Smart-Contract-Hacking/assets/77315155/8993f4c5-533d-47e0-9d4c-93328b942b2c)

The final amount in Attacker's contract will be his own deposited amount as well as all the funds from Vulnerable contract
![Screenshot 2024-01-19 214257](https://github.com/shrxyeh/Smart-Contract-Hacking/assets/77315155/a86479b5-dd89-4ade-93dd-51e007d9406c)

# Prevention Of Re-entrancy Attack
`Solution.sol`
In the contract we can declare a global variable `lock`. In the withdraw function we can initially check if `lock` is `false`,then override the lock variable to `true` after the function is executed for the first time by any other external contract.Thus the codeblock gets restricted and doesn't allow a recursive call of the withdraw function unless the entire function is completed.

Solidity
```
bool lock;
function withdraw()public 
    {
        //Lock the codeblock
        require(lock==false,"Locked");
        lock=true;

        uint bal=balances[msg.sender];
        require(bal>0);

        (bool sent,)=msg.sender.call{value:bal}("");
        require(sent,"Failed to send Ether");

        lock=false;
        //unlock the codeblock after execution

    }
```

