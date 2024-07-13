import pkg from 'crypto-js';
const { SHA256, enc } = pkg;

function MakeHash(a, b) {
    let c = 0;
    let d = 0;
    let a_bytes = BigInt(a).toString(16).padStart(32, '0');
    let b_bytes = BigInt(b).toString(16).padStart(32, '0');
    let c_bytes = c.toString(16).padStart(32, '0');
    let d_bytes = d.toString(16).padStart(32, '0');

    let l = a_bytes + b_bytes;
    let r = c_bytes + d_bytes;
    let sum = l + r;

    let lh = SHA256(enc.Hex.parse(sum)).toString(enc.Hex);
    let w = BigInt(`0x${lh.substring(0, 32)}`);  // Take the first 32 characters of the hash and convert to BigInt

    return w;
}

function MerkleTree(x, y, n, m) {
    const N = 4;
    let Current = [BigInt(x), BigInt(y), BigInt(n), BigInt(m)];
    let Level_1 = [BigInt('6441948221896607572742608488120559578'), BigInt('6441948221896607572742608488120559578')];
    let Level_2 = [BigInt('6441948221896607572742608488120559578')];

    // First level
    for (let i = 0; i < 2; i++) {
        Level_1[i] = MakeHash(Current[2 * i], Current[2 * i + 1]);
        //console.log(Current[2 * i], Current[2 * i + 1]);
    }

    // Second level
    for (let i = 0; i < 1; i++) {
        Level_2[i] = MakeHash(Level_1[2 * i], Level_1[2 * i + 1]);
    }

    return Level_2[0];
}

let r = MerkleTree(1, 2, 3, 4);
//console.log(r.toString());  // Convert BigInt to string for display

const N = 4;
let x = BigInt(1);
let y = BigInt(2);
let n = BigInt(3);
let m = BigInt(4);

let Current = [BigInt('6441948221896607572742608488120559578'), BigInt('6441948221896607572742608488120559578'), BigInt('6441948221896607572742608488120559578'), BigInt('6441948221896607572742608488120559578')];
let Level_1 = [BigInt('6441948221896607572742608488120559578'), BigInt('6441948221896607572742608488120559578')];
let Level_2 = [BigInt('6441948221896607572742608488120559578')];

Current[0] = BigInt(1);
Current[1] = BigInt(2);
Current[2] = BigInt(3);
Current[3] = BigInt(4);

// First level
for (let i = 0; i < 2; i++) {
    Level_1[i] = MakeHash(Current[2 * i], Current[2 * i + 1]);
}

// Second level
for (let i = 0; i < 1; i++) {
    Level_2[i] = MakeHash(Level_1[2 * i], Level_1[2 * i + 1]);
}

let root = Level_2[0];
console.log(root.toString());